let meta = #{
    name: "spec-check",
    description: "Read-only audit of whether the repository still describes itself honestly",
    when_to_use: "Before trusting a handoff, when picking a project up after time away, at a phase checkpoint, or when the human asks whether the specifications still match the code.",
    phases: [
        #{ title: "Audit", detail: "handoff, tasks, placeholders, untested Musts" },
    ],
};

let report_schema = #{
    "type": "object",
    "required": ["summary"],
    "properties": #{
        "summary": #{ "type": "string" },
        "must_fix": #{
            "type": "array",
            "maxItems": 20,
            "items": #{
                "type": "object",
                "required": ["check", "file", "issue"],
                "properties": #{
                    "check": #{ "type": "string" },
                    "file": #{ "type": "string" },
                    "issue": #{ "type": "string" },
                },
            },
        },
        "worth_knowing": #{
            "type": "array",
            "maxItems": 20,
            "items": #{
                "type": "object",
                "required": ["check", "issue"],
                "properties": #{
                    "check": #{ "type": "string" },
                    "issue": #{ "type": "string" },
                },
            },
        },
        "unverified": #{
            "type": "array",
            "maxItems": 12,
            "items": #{ "type": "string" },
        },
    },
};

phase("Audit");

let audit_prompt = "";
audit_prompt += "Audit this spec-driven repository and report. Change nothing: no edits, no commits, no new files. ";
audit_prompt += "Use read_file, grep, list_dir, and git. Do not use file-edit tools. ";
audit_prompt += "Read AGENTS.md, RUNTIME.md, docs/INDEX.md, HANDOFF.md, TASKS.md, the plans under docs/plans/active/, and docs/REQUIREMENTS.md. Use git for the real state. ";
audit_prompt += "Check all of the following. ";
audit_prompt += "1. Handoff against git: do the branch, SHA, and just-proven claim in HANDOFF.md match git? Name the drift. ";
audit_prompt += "2. Tasks against the plan: is every Ready or Done task in TASKS.md authorized by an Approved plan? Is any plan task missing from the queue? Does a Done task have the tests and evidence it claims? ";
audit_prompt += "3. Placeholders: bracketed template text still unreplaced in files the project actually uses. Ignore the template files themselves. ";
audit_prompt += "4. Untested Musts: requirements marked Must with no test that would fail if the behavior were deleted. Name the requirement id and where you looked. ";
audit_prompt += "5. Orphans: documents that answer no question the project has, and links pointing at files that do not exist. ";
audit_prompt += "6. Commands: does AGENTS.md list commands that exist and run, or fake ones nobody replaced? ";
audit_prompt += "7. Secrets: anything credential-shaped committed to the tree. ";
audit_prompt += "Return summary, must_fix as {check, file, issue}, worth_knowing as {check, issue}, and unverified as strings naming checks you could not complete. ";
audit_prompt += "Empty must_fix is valid only after you have read the files and git. An unverified check is not a pass.";

let audited = agent(audit_prompt, #{
    label: "spec-check",
    agent_type: "explore",
    capability_mode: "execute",
    output_schema: report_schema,
});

if audited == () || !audited.success || audited.output == () || audited.output.summary == () {
    let failed = "Spec-check did not return usable evidence. Treat the repository as unverified, not as a pass.";
    let failed_path = write_scratch_file("spec-check-report.md", failed);
    complete(#{ summary: failed, ok: false, path: failed_path });
}

let summary = audited.output.summary;
let must_fix = [];
let worth_knowing = [];
let unverified = [];
if audited.output.must_fix != () {
    must_fix = audited.output.must_fix;
}
if audited.output.worth_knowing != () {
    worth_knowing = audited.output.worth_knowing;
}
if audited.output.unverified != () {
    unverified = audited.output.unverified;
}

let report = "";
report += "# Spec-check\n\n";
report += summary;
report += "\n\n";
report += "## Must fix (";
report += must_fix.len().to_string();
report += ")\n\n";
if must_fix.len() == 0 {
    report += "None after the audit ran.\n";
} else {
    let mi = 0;
    while mi < must_fix.len() {
        let item = must_fix[mi];
        report += "- **";
        report += item.check;
        report += "** `";
        report += item.file;
        report += "`: ";
        report += item.issue;
        report += "\n";
        mi += 1;
    }
}
report += "\n## Worth knowing (";
report += worth_knowing.len().to_string();
report += ")\n\n";
if worth_knowing.len() == 0 {
    report += "None.\n";
} else {
    let wi = 0;
    while wi < worth_knowing.len() {
        let item = worth_knowing[wi];
        report += "- **";
        report += item.check;
        report += "**: ";
        report += item.issue;
        report += "\n";
        wi += 1;
    }
}
report += "\n## Unverified (";
report += unverified.len().to_string();
report += ")\n\n";
if unverified.len() == 0 {
    report += "None.\n";
} else {
    let ui = 0;
    while ui < unverified.len() {
        report += "- ";
        report += unverified[ui];
        report += "\n";
        ui += 1;
    }
}

let report_path = write_scratch_file("spec-check-report.md", report);
let headline = "";
headline += "Must fix: ";
headline += must_fix.len().to_string();
headline += ". Worth knowing: ";
headline += worth_knowing.len().to_string();
headline += ". Unverified: ";
headline += unverified.len().to_string();
headline += ". ";
headline += summary;

complete(#{
    summary: headline,
    ok: must_fix.len() == 0,
    must_fix: must_fix,
    worth_knowing: worth_knowing,
    unverified: unverified,
    path: report_path,
});
