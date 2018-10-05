<#
    Get MacOS version
#>
function GetMacVersion () {
    $darwinVersion = GetDarwinVersion

    $osDistro = [OSVersion.Distributions]::MacOS
    $majorVer, $minorVer, $buildVer = 0, 0, 0
    switch ($darwinVersion.Major) {
        18 {
            # macOS Mojave (10.14)
            $majorVer, $minorVer = 10, 14
            $buildVer = $darwinVersion.Minor
            break
        }
        17 {
            # macOS High Sierra (10.13)
            $majorVer, $minorVer = 10, 13
            $buildVer = switch ($darwinVersion.Minor) {
                0 { 0; break }
                Default { $_ - 1; break }
            }
            break
        }
        16 { 
            # macOS Sierra (10.12)
            $majorVer, $minorVer = 10, 12
            $buildVer = switch ($darwinVersion.Minor) {
                0 { 0; break }
                1 { 1; break }
                Default { $_ - 1; break }
            }
            break
        }
        15 {
            # OSX El Capitan (10.11)
            $majorVer, $minorVer = 10, 11
            $buildVer = switch ($darwinVersion.Minor) {
                0 {
                    if ([string]::IsNullOrEmpty((GetBuildVersion))) { 0 } else { 1 }
                    break
                }
                Default { $_; break }
            }
            break
        }
        Default {
            $majorVer, $minorVer, $buildVer = 10, ($darwinVersion.Major - 4), $darwinVersion.Minor
            break
        }
    }
    $osVersion = New-Object 'System.Version' -ArgumentList @($majorVer, $minorVer, $buildVer)
    
    $caption = GetOSCaption
    
    return New-Object 'OSVersion.OSVersionInfo' -ArgumentList @($osDistro, $osVersion, $caption)
}

function GetDarwinVersion () {
    return [System.Environment]::OSVersion.Version
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