let meta = #{
    name: "work-plan",
    description: "Burn down the approved plan until the next phase checkpoint, a stop, or the task cap",
    when_to_use: "An implementation plan is Approved and you want the next tasks done without Ready-ing each one",
    phases: [
        #{ title: "Assess", detail: "read the plan and pick the next task" },
        #{ title: "Deliver", detail: "implement, test, and review" },
        #{ title: "Checkpoint", detail: "stop for you at a phase or blocker" },
    ],
};

let assess_schema = #{
    "type": "object",
    "required": ["action"],
    "properties": #{
        "action": #{ "type": "string" },
        "next_task": #{ "type": "string" },
        "phase": #{ "type": "string" },
        "extra_reviews": #{ "type": "array", "items": #{ "type": "string" } },
        "reason": #{ "type": "string" },
    },
};

let impl_schema = #{
    "type": "object",
    "required": ["action"],
    "properties": #{
        "action": #{ "type": "string" },
        "task_id": #{ "type": "string" },
        "reason": #{ "type": "string" },
        "extra_reviews": #{ "type": "array", "items": #{ "type": "string" } },
    },
};

let review_schema = #{
    "type": "object",
    "required": ["required_findings"],
    "properties": #{
        "required_findings": #{
            "type": "array",
            "maxItems": 12,
            "items": #{
                "type": "object",
                "required": ["id", "issue"],
                "properties": #{
                    "id": #{ "type": "string" },
                    "issue": #{ "type": "string" },
                },
            },
        },
    },
};

let max_tasks = 3;
if args != () && args.max_tasks != () {
    max_tasks = args.max_tasks;
}

let finished = [];
let halt_action = "idle";
let halt_reason = "";
let i = 0;
let looping = true;

while looping && i < max_tasks {
    phase("Assess");

    let assess_prompt = "";
    assess_prompt += "You are assessing a spec-driven Grok Build repo. Use read_file and grep. ";
    assess_prompt += "Read AGENTS.md, docs/INDEX.md, HANDOFF.md, TASKS.md, and the Approved plan under docs/plans/active/. ";
    assess_prompt += "Verify git branch and whether HANDOFF.md matches reality. ";
    assess_prompt += "Return action: continue | stop_phase | stop_blocked | stop_idle. ";
    assess_prompt += "continue only if a next task is authorized by an Approved plan, dependencies are Done, and criteria are testable. ";
    assess_prompt += "Set next_task to the task id like T-014. extra_reviews may contain only security and/or ui. ";
    assess_prompt += "stop_phase if the current phase tasks are Done and its validation exists. ";
    assess_prompt += "stop_blocked if the plan is wrong, sources conflict, or an expensive question is open. ";
    assess_prompt += "stop_idle if there is no Approved plan or no remaining authorized task. ";
    assess_prompt += "Do not implement. Do not invent a task. Empty extra_reviews is valid only after you have read the plan.";

    let assessed = agent(assess_prompt, #{
        label: "assess",
        capability_mode: "execute",
        output_schema: assess_schema,
    });

    let action = "";
    let next_task = "";
    let extra = [];
    if assessed != () && assessed.success && assessed.output != () && assessed.output.action != () {
        action = assessed.output.action;
        if assessed.output.next_task != () {
            next_task = assessed.output.next_task;
        }
        if assessed.output.reason != () {
            halt_reason = assessed.output.reason;
        }
        if assessed.output.extra_reviews != () {
            extra = assessed.output.extra_reviews;
        }
    } else {
        halt_action = "idle";
        halt_reason = "Assess failed or returned no action.";
        looping = false;
    }

    if looping {
        if action != "continue" || next_task == "" {
            if action == "" {
                halt_action = "idle";
            } else {
                halt_action = action;
            }
            looping = false;
        }
    }

    if looping {
        phase("Deliver");

        let impl_prompt = "";
        impl_prompt += "Act as the Software Engineer in agents/software-engineer.md. Follow AGENTS.md. ";
        impl_prompt += "Complete only task ";
        impl_prompt += next_task;
        impl_prompt += ". Read the Approved plan, TASKS.md, HANDOFF.md, and only the linked specs and code. ";
        impl_prompt += "Implement the smallest change, add tests, run the required commands, update TASKS.md and HANDOFF.md, commit on the current plan branch. ";
        impl_prompt += "Do not merge to v1. Do not invent requirements. Do not expand the plan. ";
        impl_prompt += "Return action: done | blocked. If blocked, say why. ";
        impl_prompt += "If the task needs security or ui review beyond the default test review, put them in extra_reviews. ";
        impl_prompt += "Use the tools. Do not claim a check passed unless it ran.";

        let impl_label = "implement:";
        impl_label += next_task;
        let implemented = agent(impl_prompt, #{
            label: impl_label,
            capability_mode: "all",
            output_schema: impl_schema,
        });

        if implemented == () || !implemented.success || implemented.output == () || implemented.output.action != "done" {
            halt_action = "stop_blocked";
            if implemented != () && implemented.output != () && implemented.output.reason != () {
                halt_reason = implemented.output.reason;
            } else {
                halt_reason = "Implement did not finish ";
                halt_reason += next_task;
            }
            looping = false;
        } else {
            if implemented.output.extra_reviews != () {
                extra = implemented.output.extra_reviews;
            }

            let want_security = false;
            let want_ui = false;
            let ei = 0;
            while ei < extra.len() {
                let item = extra[ei];
                if item == "security" {
                    want_security = true;
                }
                if item == "ui" {
                    want_ui = true;
                }
                ei += 1;
            }

            let review_jobs = [];

            let test_prompt = "";
            test_prompt += "Act as the Test Engineer in agents/test-engineer.md. You did not write this change. ";
            test_prompt += "Review task ";
            test_prompt += next_task;
            test_prompt += ". Read the task, linked requirements, the plan, and the git diff for the latest commit. Use read_file, grep, and git. ";
            test_prompt += "Find unmet acceptance criteria, tests that would not fail if the behavior were deleted, and missing failure paths. ";
            test_prompt += "Return required_findings as {id, issue}. Empty list is valid only after you have read the diff and the tests.";

            let test_label = "review-test:";
            test_label += next_task;
            review_jobs.push(#{
                prompt: test_prompt,
                label: test_label,
                capability_mode: "execute",
                output_schema: review_schema,
            });

            if want_security {
                let sec_prompt = "";
                sec_prompt += "Act as the Security Reviewer in agents/security-reviewer.md. You did not write this change. ";
                sec_prompt += "Review task ";
                sec_prompt += next_task;
                sec_prompt += " at the current SHA. Read the diff and any auth, data, or trust code it touches. ";
                sec_prompt += "Required findings only for confirmed issues. Empty list is valid only after you inspected the diff.";
                let sec_label = "review-security:";
                sec_label += next_task;
                review_jobs.push(#{
                    prompt: sec_prompt,
                    label: sec_label,
                    capability_mode: "execute",
                    output_schema: review_schema,
                });
            }

            if want_ui {
                let ui_prompt = "";
                ui_prompt += "The user can see this change. Review task ";
                ui_prompt += next_task;
                ui_prompt += ". Read the UI and, if AGENTS.md has a run command that works, exercise the path. ";
                ui_prompt += "Required findings: broken flow, missing failure feedback, inaccessible required action. ";
                ui_prompt += "Do not file taste nits as required. Empty list is valid only after you looked at the UI or honestly report you could not run it.";
                let ui_label = "review-ui:";
                ui_label += next_task;
                review_jobs.push(#{
                    prompt: ui_prompt,
                    label: ui_label,
                    capability_mode: "all",
                    output_schema: review_schema,
                });
            }

            let review_results = parallel(review_jobs);
            let required = [];
            let ri = 0;
            while ri < review_results.len() {
                let rr = review_results[ri];
                if rr != () && rr.success && rr.output != () && rr.output.required_findings != () {
                    let findings = rr.output.required_findings;
                    let fi = 0;
                    while fi < findings.len() {
                        required.push(findings[fi]);
                        fi += 1;
                    }
                } else {
                    required.push(#{
                        id: "review-unusable",
                        issue: "A required review did not return usable evidence.",
                    });
                }
                ri += 1;
            }

            if required.len() > 0 {
                let fix_prompt = "";
                fix_prompt += "Act as the Software Engineer in agents/software-engineer.md. ";
                fix_prompt += "Fix only required findings for task ";
                fix_prompt += next_task;
                fix_prompt += ". Findings JSON: ";
                fix_prompt += json_encode(required);
                fix_prompt += " Add regression tests, run the required commands, update TASKS.md and HANDOFF.md, commit. ";
                fix_prompt += "Do not merge to v1. Return action: done | blocked.";

                let fix_label = "fix:";
                fix_label += next_task;
                let fixed = agent(fix_prompt, #{
                    label: fix_label,
                    capability_mode: "all",
                    output_schema: impl_schema,
                });

                if fixed == () || !fixed.success || fixed.output == () || fixed.output.action != "done" {
                    halt_action = "stop_blocked";
                    halt_reason = "Required findings could not be fixed for ";
                    halt_reason += next_task;
                    looping = false;
                }
            }

            if looping {
                finished.push(next_task);
                i += 1;
            }
        }
    }
}

if halt_action == "idle" && finished.len() > 0 {
    halt_action = "cap";
    halt_reason = "Hit max_tasks. Run /work-plan again to continue the phase.";
}

phase("Checkpoint");

let summary = "";
summary += "Tasks completed this run: ";
summary += finished.len().to_string();
if finished.len() > 0 {
    summary += " (";
    let fi = 0;
    while fi < finished.len() {
        if fi > 0 {
            summary += ", ";
        }
        summary += finished[fi];
        fi += 1;
    }
    summary += ")";
}
summary += ". Halt: ";
summary += halt_action;
if halt_reason != "" {
    summary += " - ";
    summary += halt_reason;
}

if halt_action == "stop_phase" || halt_action == "stop_blocked" {
    let msg = "";
    msg += summary;
    msg += " Look at the running software and HANDOFF.md. Continue, merge the phase to v1, or change the plan.";
    await_user("user", msg);
}

let report = write_scratch_file("work-plan-report.md", summary);
complete(#{ summary: summary, tasks: finished, halt: halt_action, path: report });
