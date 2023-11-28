<#
.SYNOPSIS
A script to handle getting oh-my-posh setup

.DESCRIPTION
A script to automate most of the steps to get a good looking terminal going.

.EXAMPLE
btTerminalBling.ps1

.NOTES
Requires winget.

#>
#Biztech Consulting - 2023
#Version 1.0.0
# Written by MrDataWolf
# Tested and co-developed by Kevin
# Get the latest version at https://github.com/mrdatawolf/btGetTerminalBling
$blingApps = @("Microsoft.WindowsTerminal", "Microsoft.Powershell", "Git.git")
$blingAppsFromWinget = @("JanDeDobbeleer.OhMyPosh")
function Install-Apps {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]$apps,
        [string[]]$source
    )

    $totalApps = $apps.Count
    for ($i = 0; $i -lt $totalApps; $i++) {
        $app = $apps[$i]
        Write-Progress -Activity "Installing applications - $app" -Status "$([Math]::Floor((($i + 1) / $totalApps) * 100))% Complete:" -PercentComplete ([Math]::Floor((($i + 1) / $totalApps) * 100))
        $wingetlist = winget list --id $app
        if ($LASTEXITCODE -eq 0) {
            Write-Host " $app already installed"  -ForegroundColor Cyan
        } else {
            if ($source) { winget install $app -s $source --silent } else { winget install $app --silent }
            if ($LASTEXITCODE -eq 0) {
                Write-Host "$app installed" -ForegroundColor Green
            } else {
                Write-Host "$app failed to install" -ForegroundColor Red
            }
        }
    }
}
Write-Host "Installing needed apps" -ForegroundColor Cyan
Install-Apps -apps $blingApps
Install-Apps -apps $blingAppsFromWinget -source "winget"

Write-Host "Adding a driectory to store the config"
mkdir ~\Documents\PowerShell
Write-Host "***"
Write-Host " 1. Goto https://www.nerdfonts.com/font-downloads, Download Caskaydia Cove Nerd Font" -ForegroundColor Cyan
Write-Host "  1a. Unzip it and install Caskaydia Cove Nerd Font Complete"
Write-Host " 2. Set PS7 as default in Terminal (Close and open Terminal, Settings > Startup > Default Profile > PowerShell)"-ForegroundColor Cyan
Write-Host " 3. Run Install-Module posh-git -Scope CurrentUser"-ForegroundColor Cyan
Write-Host " 4. Run Install-Module terminal-icons -Scope CurrentUser"-ForegroundColor Cyan
Write-Host " 5. Close and open Terminal, Settings > Profiles/PowerShell > Appearance > Text/Font face, check 'Show all fonts', drop down and select CaskaydiaCove Nerd Font Mono"-ForegroundColor Cyan
Write-Host "***"
Write-Host "Copy this and be ready to paste the following into the notepad we will open for you:"-ForegroundColor Cyan
Write-Host " Import-Module posh-git"
Write-Host " oh-my-posh init pwsh --config $env:POSH_THEMES_PATH\atomic.omp.json | Invoke-Expression"
Write-Host " Import-Module -Name Terminal-Icons"
$userInput = Read-Host "Are you ready to continue? (Y/n)" 
if ($userInput -eq "n") {
} else {
    notepad $PROFILE
}
Write-Host "Close terminal and re-open"