<#
    Get Windows OS version
#>
function GetWindowsVersion () {
    $cimInfo = $null
    try {
        $cimInfo = Get-CimInstance -ClassName Win32_OperatingSystem -Property Version, ProductType, Caption `
            | ForEach-Object { [PSCustomObject]@{ Version = [Version]$_.Version; ProductType = $_.ProductType; Caption = $_.Caption } }
    } catch {
        $cimInfo = Get-WmiObject -Class Win32_OperatingSystem -Property Version, ProductType, Caption `
            | ForEach-Object { [PSCustomObject]@{ Version = [Version]$_.Version; ProductType = $_.ProductType; Caption = $_.Caption } }
    }
    # 
    $ProductType_WorkStation = 1; # see : https://msdn.microsoft.com/en-us/library/aa394239.aspx

    # see : http://www.atmarkit.co.jp/ait/articles/1707/31/news028.html
    $osDistro = [OSVersion.Distributions]::Unknown
    $majorVer, $minorVer, $buildVer = 0, 0, 0
    switch ($cimInfo.Version.Major) {
        10 {
            # Windows 10
            if ($cimInfo.ProductType -eq $ProductType_WorkStation) {
                $osDistro = [OSVersion.Distributions]::Windows
                $majorVer = 10
                $minorVer = switch ($cimInfo.Version.Build) {
                    {$_ -gt 16299} { 1803; continue; } # Spring Creators Update (preview)
                    16299 { 1709; continue; }          # Fall Creators Update
                    15063 { 1703; continue; }          # Creators Update
                    14393 { 1607; continue; }          # Anniversary Update
                    10586 { 1511; continue; }          # November Update
                    Default { 1507; continue; }        # Initial release
                }
                $buildVer = 0
                continue
            }
            # Windows Server 2016 / Windows Server SAC
            switch ($cimInfo.Version.Build) {
                {$_ -ge 17623} {
                    # Windows Server 2019 (preview)
                    $osDistro = [OSVersion.Distributions]::WindowsServer
                    $majorVer, $minorVer, $buildVer = 2019, 1, 0
                    continue
                }
                {$_ -ge 17035} {
                    # Windows Server 1803 (preview)
                    $osDistro = [OSVersion.Distributions]::WindowsServerSAC
                    $majorVer, $minorVer, $buildVer = 1803, 1, 0
                    continue
                }
                16299 {
                    # Windows Server 1709
                    $osDistro = [OSVersion.Distributions]::WindowsServerSAC
                    $majorVer, $minorVer, $buildVer = 1709, 1, 0
                    continue
                }
                Default {
                    # Windows Server 2016 (Build 14393)
                    $osDistro = [OSVersion.Distributions]::WindowsServer
                    $majorVer, $minorVer, $buildVer = 2016, 1, 0
                    continue
                }
            }
            continue
        }
        6 {
            switch ($cimInfo.Version.Minor) {
                3 {
                    # Windows 8.1
                    if ($cimInfo.ProductType -eq $ProductType_WorkStation) {
                        $osDistro = [OSVersion.Distributions]::Windows
                        $majorVer, $minorVer, $buildVer = 8, 1, 0
                        continue
                    }
                    # Windows Server 2012 R2
                    $osDistro = [OSVersion.Distributions]::WindowsServer
                    $majorVer, $minorVer, $buildVer = 2012, 2, 0
                    continue
                }
                2 {
                    # Windows 8
                    if ($cimInfo.ProductType -eq $ProductType_WorkStation) {
                        $osDistro = [OSVersion.Distributions]::Windows
                        $majorVer, $minorVer, $buildVer = 8, 0, 0
                        continue
                    }
                    # Windows Server 2012
                    $osDistro = [OSVersion.Distributions]::WindowsServer
                    $majorVer, $minorVer, $buildVer = 2012, 1, 0
                    continue
                }
                1 {
                    # Windows 7
                    if ($cimInfo.ProductType -eq $ProductType_WorkStation) {
                        $osDistro = [OSVersion.Distributions]::Windows
                        $majorVer = 7
                        $minorVer = 0
                        $buildVer = switch ($cimInfo.Version.Build) {
                            7601 { 1; continue; }    # Windows 7 SP1
                            7600 { 0; continue; }    # Windows 7
                            Default { 0; continue; } # Windows 7 
                        }
                        continue
                    }
                    # Windows Server 2008 R2
                    $osDistro = [OSVersion.Distributions]::WindowsServer
                    $majorVer = 2008
                    $minorVer = 2
                    $buildVer = switch ($cimInfo.Version.Build) {
                        7601 { 1; continue; }    # Windows Server 2008 R2 SP1 
                        7600 { 0; continue; }    # Windows Server 2008 R2
                        Default { 0; continue; } # Windows Server 2008 R2
                    }
                    continue
                }
                0 {
                    # Vista
                    if ($cimInfo.ProductType -eq $ProductType_WorkStation) {
                        $osDistro = [OSVersion.Distributions]::Windows
                        $majorVer = 6
                        $minorVer = 0
                        $buildVer = switch ($cimInfo.Version.Build) {
                            6002 { 2; continue; }    # Vista SP2
                            6001 { 1; continue; }    # Vista SP1 
                            Default { 0; continue; } # Vista 
                        }
                        continue
                    }
                    # Windows Server 2008
                    $osDistro = [OSVersion.Distributions]::WindowsServer
                    $majorVer = 2008
                    $minorVer = 1
                    $buildVer = switch ($cimInfo.Version.Build) {
                        6002 { 2; continue; }    # Windows Server 2008 SP2 
                        6001 { 1; continue; }    # Windows Server 2008 SP1 
                        Default { 0; continue; } # Windows Server 2008
                    }
                    continue
                }
            }
        }
        Default {
            # Unknown Windows
            $osDistro = if ($cimInfo.ProductType -eq $ProductType_WorkStation) {
                [OSVersion.Distributions]::Windows
            } else {
                [OSVersion.Distributions]::WindowsServer
            }
            $osVersion = $cimInfo.Version
            continue
        }
    }
    $osVersion = New-Object 'System.Version' -ArgumentList @($majorVer, $minorVer, $buildVer)

    return New-Object 'OSVersion.OSVersionInfo' -ArgumentList @($osDistro, $osVersion, $cimInfo.Caption)
}
