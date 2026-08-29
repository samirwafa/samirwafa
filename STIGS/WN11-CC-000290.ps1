<#
.SYNOPSIS
DISA STIG WN11-CC-000290 requires Windows 11 Remote Desktop Services to use High Level encryption for client connections. This protects RDP communications from interception and helps safeguard sensitive information transmitted during remote sessions.

.NOTES
    Author          : Samir Wafa
    LinkedIn        : linkedin.com/in/samirwafa/
    GitHub          : github.com/samirwafa
    Date Created    : 2026-08-28
    Last Modified   : 2026-08-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000290
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000290/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
#>

#WN11-CC-000290

$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"

# Create the registry path if it does not exist
New-Item -Path $Path -Force | Out-Null

# Set RDP client connection encryption to High Level
New-ItemProperty -Path $Path `
    -Name "MinEncryptionLevel" `
    -PropertyType DWORD `
    -Value 3 `
    -Force | Out-Null

# Verify
Get-ItemProperty -Path $Path -Name "MinEncryptionLevel"
