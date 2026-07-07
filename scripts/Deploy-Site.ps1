<#
.SYNOPSIS
    Deploys the crucial agent-readme.md website files from the Git repository
    working folder to an IIS site folder under C:\inetpub.

.DESCRIPTION
    Copies only the files required to serve the site (the "deploy set"):
    index.html, web.config, agent-readme.md, and the assets, spec, and
    examples folders.  Repository-management files such as .git, .gitignore,
    .gitattributes, README.md, and this scripts folder are intentionally
    excluded so they are never published to the web root.

    The destination is built as <DestinationRoot>\<SiteFolderName>.  Both parts
    are parameterized so the same script can target different sites or roots.

    The script supports -WhatIf and -Confirm.  Use -Clean to remove existing
    content in the destination before copying, producing an exact mirror of the
    deploy set.

.PARAMETER SourcePath
    The repository working folder that contains the site files.  Defaults to the
    parent of this script's folder (the repository root when the script lives in
    the repo's scripts folder).

.PARAMETER DestinationRoot
    The root folder that holds IIS site folders.  Defaults to C:\inetpub.

.PARAMETER SiteFolderName
    The site folder name created or updated under DestinationRoot.  Defaults to
    agent-readme.md, producing C:\inetpub\agent-readme.md.

.PARAMETER Clean
    When set, existing files and folders in the destination are removed before
    the deploy set is copied.  Without this switch, files are overwritten in
    place and any extra files already in the destination are left untouched.

.EXAMPLE
    .\Deploy-Site.ps1
    Deploys from the repository root to C:\inetpub\agent-readme.md.

.EXAMPLE
    .\Deploy-Site.ps1 -SiteFolderName 'agent-readme-staging' -WhatIf
    Shows what would be deployed to C:\inetpub\agent-readme-staging without
    making any changes.

.EXAMPLE
    .\Deploy-Site.ps1 -DestinationRoot 'D:\sites' -Clean
    Mirrors the deploy set into D:\sites\agent-readme.md, removing any stale
    files first.

.NOTES
    Site: https://agent-readme.md
    The deploy set is intentionally an allow-list, not a mirror-with-delete of
    the whole repo, so repository files can never leak into the web root.
#>
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param
(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string] $SourcePath = (Split-Path -Parent $PSScriptRoot),

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string] $DestinationRoot = 'C:\inetpub',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string] $SiteFolderName = 'agent-readme.md',

    [Parameter()]
    [switch] $Clean
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# The allow-list of files and folders that make up the deployable website.
$deploySet = @(
    'index.html'
    'web.config'
    'agent-readme.md'
    'badge.svg'
    'assets'
    'spec'
    'compare'
    'roadmap'
    'examples'
)

try
{
    $resolvedSource = (Resolve-Path -LiteralPath $SourcePath).Path
    Write-Verbose "Source folder: $resolvedSource"

    # Confirm every item in the deploy set exists before touching the destination.
    $missing = @()
    foreach ($item in $deploySet)
    {
        $itemPath = Join-Path -Path $resolvedSource -ChildPath $item
        if (-not (Test-Path -LiteralPath $itemPath))
        {
            $missing += $item
        }
    }

    if ($missing.Count -gt 0)
    {
        throw "Source is missing required deploy item(s): $($missing -join ', '). Is '$resolvedSource' the repository root?"
    }

    $destination = Join-Path -Path $DestinationRoot -ChildPath $SiteFolderName
    Write-Verbose "Destination folder: $destination"

    # Ensure the destination folder exists.
    if (-not (Test-Path -LiteralPath $destination))
    {
        if ($PSCmdlet.ShouldProcess($destination, 'Create site folder'))
        {
            New-Item -ItemType Directory -Path $destination -Force | Out-Null
            Write-Verbose "Created destination folder: $destination"
        }
    }

    # Optionally clear the destination for an exact mirror of the deploy set.
    if ($Clean)
    {
        $existing = Get-ChildItem -LiteralPath $destination -Force -ErrorAction SilentlyContinue
        foreach ($child in $existing)
        {
            if ($PSCmdlet.ShouldProcess($child.FullName, 'Remove existing item'))
            {
                Remove-Item -LiteralPath $child.FullName -Recurse -Force
            }
        }
    }

    # Copy each deploy-set item, replacing any existing copy at the destination.
    $copied = 0
    foreach ($item in $deploySet)
    {
        $sourceItem = Join-Path -Path $resolvedSource -ChildPath $item
        $targetItem = Join-Path -Path $destination -ChildPath $item

        if ($PSCmdlet.ShouldProcess($targetItem, 'Deploy'))
        {
            # Remove the existing target first so folder copies do not leave stale files behind.
            if (Test-Path -LiteralPath $targetItem)
            {
                Remove-Item -LiteralPath $targetItem -Recurse -Force
            }

            Copy-Item -LiteralPath $sourceItem -Destination $targetItem -Recurse -Force
            $copied++
            Write-Verbose "Deployed: $item"
        }
    }

    Write-Host "Deployed $copied of $($deploySet.Count) item(s) to '$destination'." -ForegroundColor Green
}
catch
{
    Write-Error "Deployment failed: $($_.Exception.Message)"
    exit 1
}
