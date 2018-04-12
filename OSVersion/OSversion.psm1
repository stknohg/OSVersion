#requires -Version 2.0
Set-Strictmode -Version 3.0
Add-Type -Path (Join-Path $PSScriptRoot "OSVersionInfo.cs")
. (Join-Path $PSScriptRoot "OSVersion.Windows.ps1")
. (Join-Path $PSScriptRoot "OSVersion.MacOS.ps1")
. (Join-Path $PSScriptRoot "OSVersion.Linux.ps1")

<#
    Get OS version
#>
function Get-OSVersion () {
    [OutputType([OSVersion.OSVersionInfo])]
    [CmdletBinding()]
    param ()
    
    # Windows PowerShell
    if ($PSVersionTable.PSVersion.Major -lt 6) {
        return GetWindowsVersion
    }

    # PowerShell Core
    if ($IsWindows) {
        return GetWindowsVersion
    }
    if ($IsMacOS) {
        return GetMacVersion
    }
    if ($IsLinux) {
        return GetLinuxVersion
    }
    throw 'Unknown platform.'
}
