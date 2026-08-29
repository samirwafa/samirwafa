<#
.SYNOPSIS
DISA STIG WN11-CC-000345 requires Basic authentication for the Windows Remote Management (WinRM) service to be disabled to prevent insecure transmission and potential credential exposure.

.NOTES
    Author          : Samir Wafa
    LinkedIn        : linkedin.com/in/samirwafa/
    GitHub          : github.com/samirwafa
    Date Created    : 2026-08-28
    Last Modified   : 2026-08-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000345
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000345/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
#>

$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service'

# Create the policy path if it does not exist
New-Item -Path $Path -Force | Out-Null

# Disable Basic authentication for the WinRM service
New-ItemProperty -Path $Path `
    -Name 'AllowBasic' `
    -PropertyType DWord `
    -Value 0 `
    -Force | Out-Null

# Verify
Get-ItemProperty -Path $Path -Name 'AllowBasic'
