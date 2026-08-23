<#
.SYNOPSIS
PowerShell script that enables PowerShell Script Block Logging and meets the requirements of DISA STIG WN11-CC-000326.

.NOTES
    Author          : Samir Wafa
    LinkedIn        : linkedin.com/in/samirwafa/
    GitHub          : github.com/samirwafa
    Date Created    : 2026-08-22
    Last Modified   : 2026-08-22
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000327
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000327/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
#>

# Sets the registry path where the PowerShell Transcription policy will be configured.
$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"

# Creates the registry key if it does not already exist.
New-Item -Path $Path -Force | Out-Null

# Starts creating a new registry value inside the Transcription registry key.
New-ItemProperty -Path $Path `

# Names the registry value "EnableTranscripting".
    -Name "EnableTranscripting" `

# Specifies that the registry value is a 32-bit DWORD.
    -PropertyType DWord `

# Sets the registry value to 1, which enables PowerShell transcription.
    -Value 1 `

# Forces the value to be created or updated if it already exists.
    -Force
