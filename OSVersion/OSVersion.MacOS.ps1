<#
    Get MacOS version
#>
function GetMacVersion () {
    #
    # Note : Since .NET 5, Environment.OSVersion dosen't return Darwin version.
    #        So I changed this method returns simply "sw_ver" version information.
    # * https://docs.microsoft.com/en-us/dotnet/core/compatibility/core-libraries/5.0/environment-osversion-returns-correct-version
    #
    $arg1 = [OSVersion.Distributions]::MacOS
    $arg2 = &{
        $majorVer, $minorVer, $buildVer = GetProductVersion
        return New-Object 'System.Version' -ArgumentList @($majorVer, $minorVer, $buildVer)
    }
    $arg3 = GetOSCaption
    return New-Object 'OSVersion.OSVersionInfo' -ArgumentList ($arg1, $arg2, $arg3)
}

function GetProductVersion () {
    try {
        return (sw_vers -productVersion).Split('.')
    } catch {
        return (0, 0, 0)
    }
}

function GetOSCaption () {
    try {
        return '{0} {1} {2}' -f (sw_vers -productName), (sw_vers -productVersion), (sw_vers -buildVersion)
    } catch {
        return ''
    }
}

function GetBuildVersion () {
    try {
        return sw_vers -buildVersion
    } catch {
        return ''
    }
}
