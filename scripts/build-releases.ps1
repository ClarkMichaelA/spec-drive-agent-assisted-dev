[CmdletBinding()]
param(
    [string]$Version = '2.2.0',
    [string]$OutputDirectory
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repositoryRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$commonRoot = Join-Path $repositoryRoot 'spec-driven-repository-scaffold/common'
$targetsRoot = Join-Path $repositoryRoot 'spec-driven-repository-scaffold/targets'
$playbookRoot = Join-Path $repositoryRoot 'spec-driven-development-playbook'
$licensePath = Join-Path $repositoryRoot 'LICENSE'

$Version = $Version.Trim()
if ($Version.StartsWith('v', [StringComparison]::OrdinalIgnoreCase)) {
    $Version = $Version.Substring(1)
}
if ($Version -notmatch '^\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?$') {
    throw "Version '$Version' must look like 2.0.0 or 2.0.0-rc.1."
}

if ([string]::IsNullOrWhiteSpace($OutputDirectory)) {
    $OutputDirectory = Join-Path $repositoryRoot 'dist'
}
$outputRoot = [IO.Path]::GetFullPath($OutputDirectory)
$repositoryPrefix = $repositoryRoot.TrimEnd([IO.Path]::DirectorySeparatorChar, [IO.Path]::AltDirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
if (-not $outputRoot.StartsWith($repositoryPrefix, [StringComparison]::OrdinalIgnoreCase)) {
    throw "OutputDirectory must remain inside the repository: $repositoryRoot"
}
if ($outputRoot -eq $repositoryRoot) {
    throw 'OutputDirectory cannot be the repository root.'
}

foreach ($requiredPath in @($commonRoot, $targetsRoot, $playbookRoot, $licensePath)) {
    if (-not (Test-Path -LiteralPath $requiredPath)) {
        throw "Required source path does not exist: $requiredPath"
    }
}

function Get-RelativeFilePaths {
    param([string]$Root)

    @(Get-ChildItem -LiteralPath $Root -Recurse -Force -File | ForEach-Object {
        [IO.Path]::GetRelativePath($Root, $_.FullName).Replace('\', '/')
    } | Sort-Object)
}

function Copy-DirectoryContents {
    param(
        [string]$Source,
        [string]$Destination
    )

    New-Item -ItemType Directory -Path $Destination -Force | Out-Null
    foreach ($item in Get-ChildItem -LiteralPath $Source -Force) {
        Copy-Item -LiteralPath $item.FullName -Destination $Destination -Recurse -Force
    }
}

function Assert-NoOverlayCollision {
    param(
        [string]$Common,
        [string]$Target
    )

    $commonPaths = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    foreach ($path in Get-RelativeFilePaths -Root $Common) {
        [void]$commonPaths.Add($path)
    }

    $collisions = @(Get-RelativeFilePaths -Root $Target | Where-Object { $commonPaths.Contains($_) })
    if ($collisions.Count -gt 0) {
        throw "Target overlays may not replace common files: $($collisions -join ', ')"
    }
}

function Write-Utf8File {
    param(
        [string]$Path,
        [string]$Content
    )

    [IO.File]::WriteAllText($Path, $Content, [Text.UTF8Encoding]::new($false))
}

$skillFrontmatterKeys = @(
    'name', 'description', 'when_to_use', 'when-to-use', 'argument-hint', 'arguments',
    'disable-model-invocation', 'user-invocable', 'allowed-tools', 'disallowed-tools',
    'model', 'effort', 'context', 'agent', 'background', 'hooks', 'paths',
    'shell', 'metadata', 'license', 'compatibility'
)

$subagentFrontmatterKeys = @(
    'name', 'description', 'tools', 'disallowedTools', 'model', 'permissionMode',
    'maxTurns', 'skills', 'mcpServers', 'hooks', 'memory', 'background', 'effort',
    'isolation', 'color', 'initialPrompt'
)

function Assert-KnownFrontmatterKeys {
    param(
        [string]$Path,
        [string]$Frontmatter,
        [string[]]$AllowedKeys
    )

    $keys = @([regex]::Matches($Frontmatter, '(?m)^(?<key>[A-Za-z][A-Za-z0-9_-]*):') |
        ForEach-Object { $_.Groups['key'].Value })
    $unknown = @($keys | Where-Object { $AllowedKeys -cnotcontains $_ })
    if ($unknown.Count -gt 0) {
        throw "Unsupported frontmatter key(s) '$($unknown -join ', ')' in $Path"
    }
}

function Assert-ValidSkill {
    param([string]$SkillPath)

    $content = Get-Content -LiteralPath $SkillPath -Raw
    if ($content -notmatch '(?s)^---\r?\n(?<frontmatter>.*?)\r?\n---\r?\n(?<body>.+)$') {
        throw "Skill must contain YAML frontmatter and a non-empty body: $SkillPath"
    }

    $frontmatter = $Matches.frontmatter
    if ($frontmatter -notmatch '(?m)^name:\s+(?<name>[a-z0-9-]+)\s*$') {
        throw "Skill name is missing or invalid: $SkillPath"
    }
    if ($Matches.name -ne (Split-Path -Leaf (Split-Path -Parent $SkillPath))) {
        throw "Skill name must match its directory: $SkillPath"
    }
    if ($frontmatter -notmatch '(?m)^description:\s+\S.+$') {
        throw "Skill description is missing: $SkillPath"
    }
    if ($content -match '\[(TODO|PLACEHOLDER)\]') {
        throw "Skill contains an unfinished placeholder: $SkillPath"
    }
    Assert-KnownFrontmatterKeys -Path $SkillPath -Frontmatter $frontmatter -AllowedKeys $skillFrontmatterKeys
}

function Assert-ValidCodexSkillMetadata {
    param([string]$MetadataPath)

    if (-not (Test-Path -LiteralPath $MetadataPath)) {
        throw "Required Codex skill metadata does not exist: $MetadataPath"
    }
    $content = Get-Content -LiteralPath $MetadataPath -Raw
    if ($content -notmatch '(?m)^interface:\s*$') {
        throw "Codex skill metadata is missing 'interface': $MetadataPath"
    }
    foreach ($key in @('display_name', 'short_description', 'default_prompt')) {
        $pattern = '(?m)^\s+{0}\s*:\s*"\S.*"\s*$' -f [regex]::Escape($key)
        if ($content -notmatch $pattern) {
            throw "Codex skill metadata is missing '$key': $MetadataPath"
        }
    }
}

function Assert-ValidCodexAgent {
    param([string]$AgentPath)

    $content = Get-Content -LiteralPath $AgentPath -Raw
    if ($content -notmatch '(?m)^name\s*=\s*"(?<name>[a-z0-9_]+)"\s*$') {
        throw "Codex agent name is missing or invalid: $AgentPath"
    }
    if ($Matches.name -ne [IO.Path]::GetFileNameWithoutExtension($AgentPath)) {
        throw "Codex agent name must match its file name: $AgentPath"
    }
    if ($content -notmatch '(?m)^description\s*=\s*"\S.+"\s*$') {
        throw "Codex agent description is missing: $AgentPath"
    }
    if ($content -notmatch '(?m)^developer_instructions\s*=\s*"""\s*$') {
        throw "Codex agent developer instructions are missing: $AgentPath"
    }
    if ($content -notmatch '(?m)^sandbox_mode\s*=\s*"read-only"\s*$') {
        throw "Codex reviewer agent must use a read-only sandbox: $AgentPath"
    }
}

function Assert-ValidSubagent {
    param([string]$AgentPath)

    $content = Get-Content -LiteralPath $AgentPath -Raw
    if ($content -notmatch '(?s)^---\r?\n(?<frontmatter>.*?)\r?\n---\r?\n(?<body>.+)$') {
        throw "Subagent must contain YAML frontmatter and a non-empty body: $AgentPath"
    }

    $frontmatter = $Matches.frontmatter
    if ($frontmatter -notmatch '(?m)^name:\s+(?<name>[a-z0-9-]+)\s*$') {
        throw "Subagent name is missing or invalid: $AgentPath"
    }
    if ($Matches.name -ne [IO.Path]::GetFileNameWithoutExtension($AgentPath)) {
        throw "Subagent name must match its file name: $AgentPath"
    }
    if ($frontmatter -notmatch '(?m)^description:\s+\S.+$') {
        throw "Subagent description is missing: $AgentPath"
    }
    Assert-KnownFrontmatterKeys -Path $AgentPath -Frontmatter $frontmatter -AllowedKeys $subagentFrontmatterKeys
}

$claudeWriteTools = @('Edit', 'Write', 'MultiEdit', 'NotebookEdit')

function Assert-ReadOnlyReviewer {
    param([string]$AgentPath)

    if (-not (Test-Path -LiteralPath $AgentPath)) {
        throw "Required read-only reviewer subagent does not exist: $AgentPath"
    }
    $content = Get-Content -LiteralPath $AgentPath -Raw
    if ($content -notmatch '(?s)^---\r?\n(?<frontmatter>.*?)\r?\n---\r?\n') {
        throw "Reviewer subagent must contain YAML frontmatter: $AgentPath"
    }
    if ($Matches.frontmatter -notmatch '(?m)^tools:\s*(?<tools>\S.*?)\s*$') {
        throw "Reviewer subagent must declare an explicit tools list, or it inherits write tools: $AgentPath"
    }
    $tools = $Matches.tools
    if ($tools -match '^[>|]') {
        throw "Reviewer subagent must list its tools inline so they can be verified: $AgentPath"
    }
    $declared = @($tools -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ })
    $granted = @($declared | Where-Object { $claudeWriteTools -contains $_ })
    if ($granted.Count -gt 0) {
        throw "Reviewer subagent must not grant write tool(s) '$($granted -join ', ')': $AgentPath"
    }
}

function Assert-ValidGrokWorkflow {
    param([string]$WorkflowPath)

    if (-not (Test-Path -LiteralPath $WorkflowPath)) {
        throw "Required Grok workflow does not exist: $WorkflowPath"
    }

    $content = Get-Content -LiteralPath $WorkflowPath -Raw
    $stem = [IO.Path]::GetFileNameWithoutExtension($WorkflowPath)
    if ($content -notmatch '(?s)let meta = #\{') {
        throw "Grok workflow is missing a meta map: $WorkflowPath"
    }
    if ($content -notmatch ('(?m)^\s*name:\s+"{0}"\s*,?\s*$' -f [regex]::Escape($stem))) {
        throw "Grok workflow meta.name must match its file name: $WorkflowPath"
    }
    if ($content -notmatch '(?m)^\s*description:\s+"\S.+"\s*,?\s*$') {
        throw "Grok workflow description is missing: $WorkflowPath"
    }
    if ($content -match '\[(TODO|PLACEHOLDER)\]') {
        throw "Grok workflow contains an unfinished placeholder: $WorkflowPath"
    }

    if ($stem -eq 'work-plan') {
        if ($content -notmatch 'prompt:\s+test_prompt,[\s\S]{0,160}capability_mode:\s*"execute"') {
            throw "work-plan test reviewer must use capability_mode execute: $WorkflowPath"
        }
        if ($content -notmatch 'prompt:\s+sec_prompt,[\s\S]{0,160}capability_mode:\s*"execute"') {
            throw "work-plan security reviewer must use capability_mode execute: $WorkflowPath"
        }
        if ($content -match 'prompt:\s+test_prompt,[\s\S]{0,160}capability_mode:\s*"all"') {
            throw "work-plan test reviewer must not use capability_mode all: $WorkflowPath"
        }
        if ($content -match 'prompt:\s+sec_prompt,[\s\S]{0,160}capability_mode:\s*"all"') {
            throw "work-plan security reviewer must not use capability_mode all: $WorkflowPath"
        }
        if ($content -notmatch 'agents/test-engineer.md') {
            throw "work-plan test reviewer must read the portable role file: $WorkflowPath"
        }
        if ($content -notmatch 'agents/security-reviewer.md') {
            throw "work-plan security reviewer must read the portable role file: $WorkflowPath"
        }
    }

    if ($stem -eq 'spec-check') {
        if ($content -match 'capability_mode:\s*"all"') {
            throw "spec-check workflow must not use capability_mode all: $WorkflowPath"
        }
        if ($content -notmatch 'capability_mode:\s*"(execute|read-only)"') {
            throw "spec-check workflow must use capability_mode execute or read-only: $WorkflowPath"
        }
    }
}

function Assert-ValidGrokProjectConfig {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        throw "Required Grok project config does not exist: $Path"
    }

    $raw = Get-Content -LiteralPath $Path -Raw
    if ($raw -notmatch '(?m)^\[permission\]\s*$') {
        throw "Grok project config must contain a [permission] table: $Path"
    }
    if ($raw -notmatch '(?m)^deny\s*=') {
        throw "Grok project config must declare deny rules: $Path"
    }
    if ($raw -notmatch '(?m)^ask\s*=') {
        throw "Grok project config must declare ask rules: $Path"
    }
    foreach ($section in @('[models]', '[ui]', '[cli]')) {
        if ($raw -match ('(?m)^{0}\s*$' -f [regex]::Escape($section))) {
            throw "Grok project config must not pin $section; those settings belong to the user: $Path"
        }
    }
    if ($raw -match '(?m)^\s*permission_mode\s*=') {
        throw "Grok project config must not set permission_mode; that belongs to the user: $Path"
    }
}

function Assert-PathScopedRule {
    param([string]$RulePath)

    $content = Get-Content -LiteralPath $RulePath -Raw
    if ($content -notmatch '(?s)^---\r?\n(?<frontmatter>.*?)\r?\n---\r?\n(?<body>.+)$') {
        throw "Rule must contain YAML frontmatter and a non-empty body: $RulePath"
    }
    if ($Matches.frontmatter -notmatch '(?m)^paths:') {
        throw "Rule must declare paths, or it loads in every session: $RulePath"
    }
}

function Assert-ValidJsonObject {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        throw "Required adapter file does not exist: $Path"
    }

    $raw = (Get-Content -LiteralPath $Path -Raw).TrimStart([char]0xFEFF)
    try {
        $document = [System.Text.Json.JsonDocument]::Parse($raw)
    } catch {
        throw "$Path is not valid JSON: $($_.Exception.Message)"
    }
    if ($document.RootElement.ValueKind -ne [System.Text.Json.JsonValueKind]::Object) {
        $document.Dispose()
        throw "$Path must contain a JSON object."
    }
    $document.Dispose()
}

function Assert-NoPlaceholders {
    param([string]$Root)

    $hits = @(Get-ChildItem -LiteralPath $Root -Recurse -Force -File |
        Select-String -Pattern '\[(TODO|PLACEHOLDER)\]')
    if ($hits.Count -gt 0) {
        $locations = $hits | ForEach-Object { "$($_.Path):$($_.LineNumber)" }
        throw "Unfinished placeholder in adapter files: $($locations -join ', ')"
    }
}

function Assert-ValidHermesProfile {
    param(
        [string]$ProfilePath,
        [string[]]$RequiredRolePaths,
        [string]$ExpectedVersion
    )

    $profileName = Split-Path -Leaf $ProfilePath
    $manifestPath = Join-Path $ProfilePath 'distribution.yaml'
    $configPath = Join-Path $ProfilePath 'config.yaml'
    $soulPath = Join-Path $ProfilePath 'SOUL.md'
    foreach ($requiredPath in @($manifestPath, $configPath, $soulPath)) {
        if (-not (Test-Path -LiteralPath $requiredPath)) {
            throw "Hermes profile '$profileName' is missing $([IO.Path]::GetFileName($requiredPath))"
        }
    }

    $manifest = Get-Content -LiteralPath $manifestPath -Raw
    if ($manifest -notmatch ('(?m)^name:\s*{0}\s*$' -f [regex]::Escape($profileName))) {
        throw "Hermes distribution name must match its directory: $manifestPath"
    }
    if ($manifest -notmatch '(?m)^version:\s*(?<version>\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?)\s*$') {
        throw "Hermes distribution version is missing or invalid: $manifestPath"
    }
    $distributionVersion = $Matches.version
    if ($distributionVersion -cne $ExpectedVersion) {
        throw "Hermes distribution version '$distributionVersion' must match release version '$ExpectedVersion': $manifestPath"
    }
    if ($manifest -notmatch '(?m)^hermes_requires:\s*["'']>=\d+\.\d+\.\d+["'']\s*$') {
        throw "Hermes distribution must declare a minimum Hermes version: $manifestPath"
    }

    $config = Get-Content -LiteralPath $configPath -Raw
    foreach ($pattern in @(
        '(?m)^\s*memory_enabled:\s*false\s*$',
        '(?m)^\s*user_profile_enabled:\s*false\s*$',
        '(?m)^\s*-\s*memory\s*$',
        '(?m)^\s*-\s*session_search\s*$'
    )) {
        if ($config -notmatch $pattern) {
            throw "Hermes profile must disable durable profile memory and session recall: $configPath"
        }
    }
    if ($config -match '(?m)^\s*(default|provider|api_key|base_url):') {
        throw "Hermes profiles must not pin model or provider settings: $configPath"
    }

    $soul = Get-Content -LiteralPath $soulPath -Raw
    if ($soul -notmatch '(?i)AGENTS\.md') {
        throw "Hermes profile must defer to AGENTS.md: $soulPath"
    }
    foreach ($rolePath in $RequiredRolePaths) {
        if ($soul -notmatch [regex]::Escape($rolePath)) {
            throw "Hermes profile must reference portable role '$rolePath': $soulPath"
        }
    }

    $forbidden = @(
        '.env', 'auth.json', 'memories', 'sessions', 'state.db', 'state.db-shm',
        'state.db-wal', 'logs', 'workspace', 'plans', 'home', 'local'
    )
    foreach ($path in $forbidden) {
        if (Test-Path -LiteralPath (Join-Path $ProfilePath $path)) {
            throw "Hermes distribution contains user state or secrets: $ProfilePath/$path"
        }
    }
}

function Get-RequiredChildFiles {
    param(
        [string]$Root,
        [string]$Filter,
        [switch]$Recurse
    )

    if (-not (Test-Path -LiteralPath $Root)) {
        throw "Required adapter directory does not exist: $Root"
    }

    $found = @(Get-ChildItem -LiteralPath $Root -Force -File -Filter $Filter -Recurse:$Recurse)
    if ($found.Count -eq 0) {
        throw "No $Filter file found under: $Root"
    }
    $found
}

$targets = @(
    [pscustomobject]@{
        Name = 'grok'
        DisplayName = 'Grok Build'
        Required = @(
            'RUNTIME.md',
            '.grok/workflows/work-plan.rhai',
            '.grok/workflows/spec-check.rhai',
            '.grok/config.toml'
        )
        Forbidden = @('.agents', '.codex', '.claude', '.hermes', 'CLAUDE.md')
    },
    [pscustomobject]@{
        Name = 'codex'
        DisplayName = 'Codex'
        Required = @(
            'RUNTIME.md',
            '.agents/skills/work-plan/SKILL.md',
            '.agents/skills/work-plan/agents/openai.yaml',
            '.codex/agents/test_engineer.toml',
            '.codex/agents/security_reviewer.toml'
        )
        Forbidden = @('.grok', '.claude', '.hermes', 'CLAUDE.md')
    },
    [pscustomobject]@{
        Name = 'claude'
        DisplayName = 'Claude Code'
        Required = @(
            'RUNTIME.md',
            'CLAUDE.md',
            '.claude/settings.json',
            '.claude/skills/work-plan/SKILL.md',
            '.claude/skills/spec-check/SKILL.md',
            '.claude/agents/test-engineer.md',
            '.claude/agents/security-reviewer.md',
            '.claude/agents/solution-architect.md',
            '.claude/agents/project-analyst.md',
            '.claude/rules/approved-artifacts.md',
            '.claude/rules/state-files.md'
        )
        Forbidden = @('.grok', '.agents', '.codex', '.hermes')
    },
    [pscustomobject]@{
        Name = 'hermes'
        DisplayName = 'Hermes Agent'
        Required = @(
            'RUNTIME.md',
            '.hermes/profiles/spec-driven-lead/distribution.yaml',
            '.hermes/profiles/spec-driven-lead/config.yaml',
            '.hermes/profiles/spec-driven-lead/SOUL.md',
            '.hermes/profiles/spec-driven-engineer/distribution.yaml',
            '.hermes/profiles/spec-driven-engineer/config.yaml',
            '.hermes/profiles/spec-driven-engineer/SOUL.md',
            '.hermes/profiles/spec-driven-test-reviewer/distribution.yaml',
            '.hermes/profiles/spec-driven-test-reviewer/config.yaml',
            '.hermes/profiles/spec-driven-test-reviewer/SOUL.md',
            '.hermes/profiles/spec-driven-security-reviewer/distribution.yaml',
            '.hermes/profiles/spec-driven-security-reviewer/config.yaml',
            '.hermes/profiles/spec-driven-security-reviewer/SOUL.md'
        )
        Forbidden = @('.grok', '.agents', '.codex', '.claude', 'CLAUDE.md')
    }
)

$providerPattern = '(?i)(\bGrok\b|\bCodex\b|\bClaude\b|\bHermes\b|\.grok|\.codex|\.claude|\.hermes|\.agents[\\/]skills)'
$commonProviderMentions = @(Get-ChildItem -LiteralPath $commonRoot -Recurse -Force -File |
    Select-String -Pattern $providerPattern)
if ($commonProviderMentions.Count -gt 0) {
    $locations = $commonProviderMentions | ForEach-Object { "$($_.Path):$($_.LineNumber)" }
    throw "Provider-specific content leaked into common/: $($locations -join ', ')"
}

$grokTargetRoot = Join-Path $targetsRoot 'grok'
$grokAdapterRoot = Join-Path $grokTargetRoot '.grok'
foreach ($workflow in Get-RequiredChildFiles -Root (Join-Path $grokAdapterRoot 'workflows') -Filter '*.rhai') {
    Assert-ValidGrokWorkflow -WorkflowPath $workflow.FullName
}
Assert-ValidGrokProjectConfig -Path (Join-Path $grokAdapterRoot 'config.toml')
Assert-NoPlaceholders -Root $grokTargetRoot

$codexAdapterRoot = Join-Path $targetsRoot 'codex'
Assert-ValidSkill -SkillPath (Join-Path $codexAdapterRoot '.agents/skills/work-plan/SKILL.md')
Assert-ValidCodexSkillMetadata -MetadataPath (Join-Path $codexAdapterRoot '.agents/skills/work-plan/agents/openai.yaml')
foreach ($subagent in Get-RequiredChildFiles -Root (Join-Path $codexAdapterRoot '.codex/agents') -Filter '*.toml') {
    Assert-ValidCodexAgent -AgentPath $subagent.FullName
}
Assert-NoPlaceholders -Root $codexAdapterRoot

$claudeTargetRoot = Join-Path $targetsRoot 'claude'
$claudeAdapterRoot = Join-Path $claudeTargetRoot '.claude'
foreach ($skill in Get-RequiredChildFiles -Root (Join-Path $claudeAdapterRoot 'skills') -Filter 'SKILL.md' -Recurse) {
    Assert-ValidSkill -SkillPath $skill.FullName
}
foreach ($subagent in Get-RequiredChildFiles -Root (Join-Path $claudeAdapterRoot 'agents') -Filter '*.md') {
    Assert-ValidSubagent -AgentPath $subagent.FullName
}
foreach ($reviewer in @('test-engineer.md', 'security-reviewer.md')) {
    Assert-ReadOnlyReviewer -AgentPath (Join-Path $claudeAdapterRoot "agents/$reviewer")
}
foreach ($rule in Get-RequiredChildFiles -Root (Join-Path $claudeAdapterRoot 'rules') -Filter '*.md') {
    Assert-PathScopedRule -RulePath $rule.FullName
}
Assert-ValidJsonObject -Path (Join-Path $claudeAdapterRoot 'settings.json')
Assert-NoPlaceholders -Root $claudeTargetRoot

$hermesTargetRoot = Join-Path $targetsRoot 'hermes'
$hermesProfilesRoot = Join-Path $hermesTargetRoot '.hermes/profiles'
$hermesRoleMap = [ordered]@{
    'spec-driven-lead' = @('agents/project-analyst.md', 'agents/solution-architect.md')
    'spec-driven-engineer' = @('agents/software-engineer.md')
    'spec-driven-test-reviewer' = @('agents/test-engineer.md')
    'spec-driven-security-reviewer' = @('agents/security-reviewer.md')
}
$hermesDistributionVersion = ($Version -split '-', 2)[0]
foreach ($profileName in $hermesRoleMap.Keys) {
    Assert-ValidHermesProfile `
        -ProfilePath (Join-Path $hermesProfilesRoot $profileName) `
        -RequiredRolePaths $hermesRoleMap[$profileName] `
        -ExpectedVersion $hermesDistributionVersion
}
Assert-NoPlaceholders -Root $hermesTargetRoot

if (Test-Path -LiteralPath $outputRoot) {
    Remove-Item -LiteralPath $outputRoot -Recurse -Force
}
New-Item -ItemType Directory -Path $outputRoot -Force | Out-Null

$zipPaths = @()
foreach ($target in $targets) {
    $targetRoot = Join-Path $targetsRoot $target.Name
    if (-not (Test-Path -LiteralPath $targetRoot)) {
        throw "Missing target source: $targetRoot"
    }
    Assert-NoOverlayCollision -Common $commonRoot -Target $targetRoot

    $packageName = "spec-driven-dev-$($target.Name)-v$Version"
    $stageRoot = Join-Path $outputRoot ".stage-$($target.Name)"
    $packageRoot = Join-Path $stageRoot $packageName
    $scaffoldOutput = Join-Path $packageRoot 'spec-driven-repository-scaffold'

    Copy-DirectoryContents -Source $commonRoot -Destination $scaffoldOutput
    Copy-DirectoryContents -Source $targetRoot -Destination $scaffoldOutput
    Copy-DirectoryContents -Source $playbookRoot -Destination (Join-Path $packageRoot 'spec-driven-development-playbook')
    Copy-Item -LiteralPath $licensePath -Destination (Join-Path $packageRoot 'LICENSE')

    foreach ($commonPath in Get-RelativeFilePaths -Root $commonRoot) {
        $sourceHash = (Get-FileHash -LiteralPath (Join-Path $commonRoot $commonPath) -Algorithm SHA256).Hash
        $renderedHash = (Get-FileHash -LiteralPath (Join-Path $scaffoldOutput $commonPath) -Algorithm SHA256).Hash
        if ($sourceHash -cne $renderedHash) {
            throw "$($target.DisplayName) changed shared file $commonPath during rendering."
        }
    }

    foreach ($required in $target.Required) {
        if (-not (Test-Path -LiteralPath (Join-Path $scaffoldOutput $required))) {
            throw "$($target.DisplayName) package is missing $required"
        }
    }
    foreach ($forbidden in $target.Forbidden) {
        if (Test-Path -LiteralPath (Join-Path $scaffoldOutput $forbidden)) {
            throw "$($target.DisplayName) package contains foreign adapter path $forbidden"
        }
    }

    $manifestEntries = Get-RelativeFilePaths -Root $scaffoldOutput
    $manifest = @(
        '# Package Manifest'
        ''
        "Rendered for **$($target.DisplayName)**."
        ''
    ) + @($manifestEntries | ForEach-Object { "- ``$_``" })
    Write-Utf8File -Path (Join-Path $scaffoldOutput 'MANIFEST.md') -Content (($manifest -join "`n") + "`n")

    $packageReadme = @(
        "# Spec-Driven, Agent-Assisted Development — $($target.DisplayName)"
        ''
        "This is the ready-to-use $($target.DisplayName) edition, version $Version."
        ''
        '1. Read `spec-driven-development-playbook/README.md`.'
        '2. Copy `spec-driven-repository-scaffold/` into a new or existing project.'
        '3. Read the copied `RUNTIME.md` and `AGENTS.md`.'
        '4. Replace placeholders, delete unused templates, and enter real validation commands.'
        ''
        'Do not add adapters from another edition. Shared method files are already included.'
        ''
    ) -join "`n"
    Write-Utf8File -Path (Join-Path $packageRoot 'README.md') -Content $packageReadme

    $zipPath = Join-Path $outputRoot "$packageName.zip"
    [IO.Compression.ZipFile]::CreateFromDirectory(
        $packageRoot,
        $zipPath,
        [IO.Compression.CompressionLevel]::Optimal,
        $true
    )
    $zipPaths += $zipPath
    Remove-Item -LiteralPath $stageRoot -Recurse -Force
}

$checksumLines = foreach ($zipPath in $zipPaths | Sort-Object) {
    $hash = (Get-FileHash -LiteralPath $zipPath -Algorithm SHA256).Hash.ToLowerInvariant()
    "$hash  $([IO.Path]::GetFileName($zipPath))"
}
Write-Utf8File -Path (Join-Path $outputRoot 'SHA256SUMS.txt') -Content (($checksumLines -join "`n") + "`n")

Write-Host "Built and validated $($zipPaths.Count) runtime editions in $outputRoot"
foreach ($zipPath in $zipPaths) {
    Write-Host "- $([IO.Path]::GetFileName($zipPath))"
}
