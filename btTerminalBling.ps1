<#
.SYNOPSIS
A script to handle getting oh-my-posh setup

.DESCRIPTION
A script to automate most of the steps to get a good looking terminal going.

.EXAMPLE
btTerminalBling.ps1

.NOTES
Requires winget. Also you might need to run "Set-ExecutionPolicy -Scope=CurrentUser Unrestricted" to use powershell scripts.

#>
#Biztech Consulting - 2023
#Version 1.0.0
# Written by MrDataWolf
# Tested and co-developed by Kevin
# Get the latest version at https://github.com/mrdatawolf/btGetTerminalBling

Write-Host "Installing needed apps"
winget install Microsoft.WindowsTerminal
winget install Microsoft.Powershell
winget install Git.git
winget install JanDeDobbeleer.OhMyPosh -s winget
Write-Host "Adding a driectory to store the config"
mkdir ~\Documents\PowerShell
Write-Host "***"
Write-Host " Goto https://www.nerdfonts.com/font-downloads, Download Caskaydia Cove Nerd Font"
Write-Host " Unzip it and install Caskaydia Cove Nerd Font Complete"
Write-Host " Set PS7 as default in Terminal (Close and open Terminal, Settings > Startup > Default Profile > PowerShell)"
Write-Host " Run Install-Module posh-git -Scope CurrentUser"
Write-Host " Run Install-Module terminal-icons -Scope CurrentUser"
Write-Host " Close and open Terminal, Settings > Profiles/PowerShell > Appearance > Text/Font face, check 'Show all fonts', drop down and select CaskaydiaCove Nerd Font Mono"
Write-Host "***"
Write-Host "Write the following into the notepad"
Write-Host "Import-Module posh-git"
Write-Host "oh-my-posh init pwsh --config $env:POSH_THEMES_PATH\atomic.omp.json | Invoke-Expression"
Write-Host "Import-Module -Name Terminal-Icons"
notepad $PROFILE
Write-Host "Close terminal and re-open"