<#
.SYNOPSIS
DISA STIG WN11-CC-000310 Prevent users from changing Windows Installer installation options

.NOTES
    Author          : Samir Wafa
    LinkedIn        : linkedin.com/in/samirwafa/
    GitHub          : github.com/samirwafa
    Date Created    : 2026-08-28
    Last Modified   : 2026-08-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000310
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000310/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
#>

# WN11-CC-000310

#Synopsis:

$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer'

New-Item -Path $Path -Force | Out-Null

New-ItemProperty `
    -Path $Path `
    -Name 'EnableUserControl' `
    -PropertyType DWord `
    -Value 0 `
    -Force | Out-Null

# Verify
Get-ItemProperty `
    -Path $Path `
    -Name 'EnableUserControl'
