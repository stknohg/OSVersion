<#
    Get MacOS version
#>
function GetMacVersion () {
    $osDistro = [OSVersion.Distributions]::MacOS
    $majorVer, $minorVer, $buildVer = 0, 0, 0
    switch ([System.Environment]::OSVersion.Version.Major) {
        15 { $majorVer, $minorVer, $buildVer = 10, 11, [System.Environment]::OSVersion.Version.Minor; continue; } # OSX El Capitan (10.11)
        16 { $majorVer, $minorVer, $buildVer = 10, 12, [System.Environment]::OSVersion.Version.Minor; continue; } # macOS Sierra (10.12)
        17 { $majorVer, $minorVer, $buildVer = 10, 13, [System.Environment]::OSVersion.Version.Minor; continue; } # macOS High Sierra (10.13)
        Default {
            $majorVer, $minorVer, $buildVer = 10, [System.Environment]::OSVersion.Version.Major - 4, [System.Environment]::OSVersion.Version.Minor; continue;
        }
    }
    $osVersion = New-Object 'System.Version' -ArgumentList @($majorVer, $minorVer, $buildVer)
    
    $caption = ''
    try {
        $caption = '{0} {1} {2}' -f (sw_vers -productName), (sw_vers -productVersion), (sw_vers -buildVersion)
    } catch {
        # do nothing
    }

    return New-Object 'OSVersion.OSVersionInfo' -ArgumentList @($osDistro, $osVersion, $caption)
}
