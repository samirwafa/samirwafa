<#
.SYNOPSIS
The PowerShell command disables camera access from the Windows lock screen to help prevent unauthorized camera use before user authentication.

.NOTES
    Author          : Samir Wafa
    LinkedIn        : linkedin.com/in/samirwafa/
    GitHub          : github.com/samirwafa
    Date Created    : 2026-08-28
    Last Modified   : 2026-08-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000005
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AU-000005/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
#>

# WN11 STIG Remediation

#WN11-CC-000005
#PowerShell remediation:

$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization'

New-Item -Path $Path -Force | Out-Null

New-ItemProperty `
    -Path $Path `
    -Name 'NoLockScreenCamera' `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

#Verify
Get-ItemProperty `
    -Path $Path `
    -Name 'NoLockScreenCamera'
