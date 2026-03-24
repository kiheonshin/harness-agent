[CmdletBinding()]
param(
    [switch]$Json
)

$projectRoot = Split-Path -Parent $PSScriptRoot

$requiredFiles = @(
    "README.md",
    "CLAUDE.md",
    ".claude/settings.json",
    ".claude/agents/requirements-analyst.md",
    ".claude/agents/implementation-engineer.md",
    ".claude/agents/quality-reviewer.md",
    ".claude/skills/project-harness/SKILL.md",
    ".claude/skills/workspace-audit/SKILL.md",
    "_workspace/00_input.md",
    "_workspace/01_plan.md",
    "_workspace/02_build_log.md",
    "_workspace/99_review.md"
)

$placeholderPatterns = @(
    "TODO:",
    "No open questions yet.",
    "Planning has not started yet."
)

$results = foreach ($relativePath in $requiredFiles) {
    $fullPath = Join-Path $projectRoot $relativePath
    $exists = Test-Path $fullPath
    $containsPlaceholder = $false

    if ($exists) {
        $content = Get-Content $fullPath -Raw
        foreach ($pattern in $placeholderPatterns) {
            if ($content -match [regex]::Escape($pattern)) {
                $containsPlaceholder = $true
                break
            }
        }
    }

    [pscustomobject]@{
        path = $relativePath
        exists = $exists
        containsPlaceholder = $containsPlaceholder
    }
}

$missing = @($results | Where-Object { -not $_.exists })
$stale = @($results | Where-Object { $_.exists -and $_.containsPlaceholder })

$summary = [pscustomobject]@{
    projectRoot = $projectRoot
    missingCount = $missing.Count
    placeholderCount = $stale.Count
    status = if ($missing.Count -gt 0) { "fail" } elseif ($stale.Count -gt 0) { "warn" } else { "pass" }
    results = $results
}

if ($Json) {
    $summary | ConvertTo-Json -Depth 4
} else {
    Write-Output "Harness workspace audit"
    Write-Output "Project root: $projectRoot"
    Write-Output "Status: $($summary.status)"
    Write-Output "Missing files: $($summary.missingCount)"
    Write-Output "Files with placeholders: $($summary.placeholderCount)"
    Write-Output ""

    foreach ($item in $results) {
        $marker = if (-not $item.exists) {
            "MISSING"
        } elseif ($item.containsPlaceholder) {
            "PLACEHOLDER"
        } else {
            "OK"
        }

        Write-Output ("[{0}] {1}" -f $marker, $item.path)
    }
}

if ($missing.Count -gt 0) {
    exit 1
}
