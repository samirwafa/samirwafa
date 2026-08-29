
<#
.SYNOPSIS
DISA STIG WN11-CC-000280 requires Windows 11 to always prompt users for a password when establishing a Remote Desktop connection. This prevents stored credentials from being automatically used to authenticate to Remote Desktop Services, reducing the risk of unauthorized access through saved RDP credentials.

.NOTES
    Author          : Samir Wafa
    LinkedIn        : linkedin.com/in/samirwafa/
    GitHub          : github.com/samirwafa
    Date Created    : 2026-08-28
    Last Modified   : 2026-08-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000280
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000280/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
#>

# WN11 STIG Remediation

#WN11-CC-000280

$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"

# Create the registry path if it does not exist
New-Item -Path $Path -Force | Out-Null

# Enable "Always prompt for password upon connection"
New-ItemProperty -Path $Path `
    -Name "fPromptForPassword" `
    -PropertyType DWORD `
    -Value 1 `
    -Force | Out-Null

# Verify the setting
Get-ItemProperty -Path $Path -Name "fPromptForPassword"
