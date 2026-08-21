<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Samir Wafa
    LinkedIn        : linkedin.com/in/samirwafa/
    GitHub          : github.com/samirwafa
    Date Created    : 2026-08-20
    Last Modified   : 2026-08-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AU-000500/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
#>

# WN11 STIG Remediation
# Configure the Application Event Log maximum size

$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Create the registry path if it does not exist
New-Item -Path $Path -Force | Out-Null

# Configure MaxSize as a DWORD value
New-ItemProperty `
    -Path $Path `
    -Name "MaxSize" `
    -PropertyType DWord `
    -Value 0x8000 `
    -Force | Out-Null
