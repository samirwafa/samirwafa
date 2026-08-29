<#
.SYNOPSIS
DISA STIG WN11-CC-000185 requires Windows 11 to be configured so that AutoRun commands cannot execute automatically. This mitigates the risk of malicious code being automatically launched from removable media or other devices. 

.NOTES
    Author          : Samir Wafa
    LinkedIn        : linkedin.com/in/samirwafa/
    GitHub          : github.com/samirwafa
    Date Created    : 2026-08-28
    Last Modified   : 2026-08-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000185
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000185/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
#>

# WN11-CC-000185
# Prevent Autorun commands

$Path = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer'

New-Item -Path $Path -Force | Out-Null

New-ItemProperty `
    -Path $Path `
    -Name 'NoAutorun' `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

# Verify
Get-ItemProperty `
    -Path $Path `
    -Name 'NoAutorun'
