<#
.SYNOPSIS
PowerShell script that enables PowerShell Script Block Logging and meets the requirements of DISA STIG WN11-CC-000326.

.NOTES
    Author          : Samir Wafa
    LinkedIn        : linkedin.com/in/samirwafa/
    GitHub          : github.com/samirwafa
    Date Created    : 2026-08-21
    Last Modified   : 2026-08-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000326
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000326/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
#>

# Define the registry path for PowerShell Script Block Logging.
$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging'

# Create the registry key if it does not already exist.
New-Item -Path $Path -Force | Out-Null

# Enable Script Block Logging by setting the registry value to 1.
New-ItemProperty `
    -Path $Path `
    -Name 'EnableScriptBlockLogging' `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null
