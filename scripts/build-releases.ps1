[CmdletBinding()]
param(
    [string]$Version = '2.1.0',
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
    'name', 'description', 'when_to_use', 'argument-hint', 'arguments',
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
        Required = @('RUNTIME.md', '.grok/workflows/work-plan.rhai')
        Forbidden = @('.agents', '.claude', 'CLAUDE.md')
    },
    [pscustomobject]@{
        Name = 'codex'
        DisplayName = 'Codex'
        Required = @('RUNTIME.md', '.agents/skills/work-plan/SKILL.md')
        Forbidden = @('.grok', '.claude', 'CLAUDE.md')
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
        Forbidden = @('.grok', '.agents')
    }
)

$providerPattern = '(?i)(\bGrok\b|\bCodex\b|\bClaude\b|\.grok|\.claude|\.agents[\\/]skills)'
$commonProviderMentions = @(Get-ChildItem -LiteralPath $commonRoot -Recurse -Force -File |
    Select-String -Pattern $providerPattern)
if ($commonProviderMentions.Count -gt 0) {
    $locations = $commonProviderMentions | ForEach-Object { "$($_.Path):$($_.LineNumber)" }
    throw "Provider-specific content leaked into common/: $($locations -join ', ')"
}

Assert-ValidSkill -SkillPath (Join-Path $targetsRoot 'codex/.agents/skills/work-plan/SKILL.md')

$claudeAdapterRoot = Join-Path $targetsRoot 'claude/.claude'
foreach ($skill in Get-RequiredChildFiles -Root (Join-Path $claudeAdapterRoot 'skills') -Filter 'SKILL.md' -Recurse) {
    Assert-ValidSkill -SkillPath $skill.FullName
}
foreach ($subagent in Get-RequiredChildFiles -Root (Join-Path $claudeAdapterRoot 'agents') -Filter '*.md') {
    Assert-ValidSubagent -AgentPath $subagent.FullName
}
foreach ($rule in Get-RequiredChildFiles -Root (Join-Path $claudeAdapterRoot 'rules') -Filter '*.md') {
    Assert-PathScopedRule -RulePath $rule.FullName
}
Assert-ValidJsonObject -Path (Join-Path $claudeAdapterRoot 'settings.json')
Assert-NoPlaceholders -Root $claudeAdapterRoot

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
