[CmdletBinding()]
param(
    [string]$Version = '2.0.0',
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
        Required = @('RUNTIME.md', 'CLAUDE.md', '.claude/skills/work-plan/SKILL.md')
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

$codexSkillPath = Join-Path $targetsRoot 'codex/.agents/skills/work-plan/SKILL.md'
$claudeSkillPath = Join-Path $targetsRoot 'claude/.claude/skills/work-plan/SKILL.md'
Assert-ValidSkill -SkillPath $codexSkillPath
Assert-ValidSkill -SkillPath $claudeSkillPath
$codexSkill = Get-Content -LiteralPath $codexSkillPath -Raw
$claudeSkill = Get-Content -LiteralPath $claudeSkillPath -Raw
if ($codexSkill -cne $claudeSkill) {
    throw 'The Codex and Claude work-plan skill bodies must remain identical.'
}

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
