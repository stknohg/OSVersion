<#
    Get MacOS version
#>
function GetMacVersion () {
    $osDistro = [OSVersion.Distributions]::MacOS
    $majorVer, $minorVer, $buildVer = 0, 0, 0
    switch ([System.Environment]::OSVersion.Version.Major) {
        17 {
            # macOS High Sierra (10.13)
            $majorVer, $minorVer = 10, 13
            $buildVer = switch ([System.Environment]::OSVersion.Version.Minor) {
                0 { 0; continue; }
                Default { $_ - 1; continue; }
            }
            continue
        }
        16 { 
            # macOS Sierra (10.12)
            $majorVer, $minorVer = 10, 12
            $buildVer = switch ([System.Environment]::OSVersion.Version.Minor) {
                0 { 0; continue; }
                1 { 1; continue; }
                Default { $_ - 1; continue; }
            }
            continue
        }
        15 {
            # OSX El Capitan (10.11)
            $majorVer, $minorVer = 10, 11
            $buildVer = switch ([System.Environment]::OSVersion.Version.Minor) {
                0 {
                    if ([string]::IsNullOrEmpty((sw_vers -buildVersion))) { 0 } else{ 1 }
                    continue
                }
                Default { $_; continue; }
            }
            continue
        }
        Default {
            $majorVer, $minorVer, $buildVer = 10, [System.Environment]::OSVersion.Version.Major - 4, [System.Environment]::OSVersion.Version.Minor
            continue
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
