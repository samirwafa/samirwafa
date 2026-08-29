<#
.SYNOPSIS
DISA STIG WN11-CC-000315 requires Windows Installer’s “Always install with elevated privileges” setting to be disabled to prevent unauthorized privilege escalation by standard users.

.NOTES
    Author          : Samir Wafa
    LinkedIn        : linkedin.com/in/samirwafa/
    GitHub          : github.com/samirwafa
    Date Created    : 2026-08-28
    Last Modified   : 2026-08-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000315/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
#>

$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer'

# Create the registry path if it does not exist
New-Item -Path $Path -Force | Out-Null

# Disable Always Install with Elevated Privileges
New-ItemProperty -Path $Path `
    -Name 'AlwaysInstallElevated' `
    -PropertyType DWord `
    -Value 0 `
    -Force | Out-Null

# Verify
Get-ItemProperty -Path $Path -Name 'AlwaysInstallElevated'
