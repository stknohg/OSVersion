<#
    Get Linux OS version
#>
function GetLinuxVersion () {
    if (-not (Test-Path -LiteralPath '/etc/os-release' -PathType Leaf)) {
        Write-Warning '/etc/os-release was not found. We can not detect Linux version.'
        return WriteUnknownVersion
    }
    
    # get os basic information.
    $linuxInfo = Get-Content '/etc/os-release' -Raw | ConvertFrom-StringData
    $osDistro = [OSVersion.Distributions]::Unknown
    $majorVer, $minorVer, $buildVer = 0, 0, 0
    $caption = ''
    switch ($linuxInfo.ID) {
        '"centos"' {
            # CentOS
            $osDistro = [OSVersion.Distributions]::CentOS
            $majorVer, $minorVer, $buildVer = ( -split (Get-Content /etc/redhat-release))[3] -split '\.'
            $caption = $linuxInfo.PRETTY_NAME.Trim('"')
            break
        }
        'debian' {
            # Debian
            $osDistro = [OSVersion.Distributions]::Debian
            $majorVer, $minorVer = (Get-Content /etc/debian_version) -split '\.'
            $buildVer = 0
            $caption = $linuxInfo.PRETTY_NAME.Trim('"')
            break
        }
        'fedora' {
            # Fedora
            $osDistro = [OSVersion.Distributions]::Fedora
            $majorVer = $LinuxInfo.VERSION_ID
            $minorVer = 0
            $buildVer = 0
            $caption = $linuxInfo.PRETTY_NAME.Trim('"')
            break
        }
        'kali' { 
            # Kali
            $osDistro = [OSVersion.Distributions]::Kali
            $majorVer, $minorVer = $linuxInfo.VERSION_ID.Trim('"') -split '\.'
            $buildVer = 0
            $caption = $linuxInfo.PRETTY_NAME.Trim('"')
            break
        }
        'opensuse' { 
            # openSUSE
            $osDistro = [OSVersion.Distributions]::OpenSUSE
            $majorVer, $minorVer = $linuxInfo.VERSION_ID.Trim('"') -split '\.'
            $buildVer = 0
            if ($majorVer -eq 42) {
                # openSUSE 42 is regarded as version 14
                $buildVer = $minorVer
                $minorVer = $majorVer
                $majorVer = 14
            }
            $caption = $linuxInfo.PRETTY_NAME.Trim('"')
            break
        }
        '"rhel"' {
            # RHEL
            $osDistro = [OSVersion.Distributions]::RHEL
            $majorVer, $minorVer = $LinuxInfo.VERSION_ID.Trim('"') -split '\.'
            $buildVer = 0
            $caption = $linuxInfo.PRETTY_NAME.Trim('"')
            break
        }
        '"sles"' { 
            # SLES
            $osDistro = [OSVersion.Distributions]::SLES
            $majorVer, $minorVer = $linuxInfo.VERSION_ID.Trim('"') -split '\.'
            $caption = $linuxInfo.PRETTY_NAME.Trim('"')
            break
        }
        'ubuntu' { 
            # Ubuntu
            $osDistro = [OSVersion.Distributions]::Ubuntu
            $majorVer, $minorVer = $linuxInfo.VERSION_ID.Trim('"') -split '\.'
            $buildVer = 0
            # if the VERSION contains LTS point release, we set the point to build version.
            $v2 = ( -split $linuxInfo.VERSION.Trim('"'))[0] -split '\.'
            if ($v2.Length -eq 3) {
                $buildVer = $v2[2]
            }
            $caption = $linuxInfo.PRETTY_NAME.Trim('"')
            break
        }
        Default {
            $osDistro = [OSVersion.Distributions]::Unknown
            $majorVer, $minorVer, $buildVer = 0, 0, 0
            $caption = $linuxInfo.PRETTY_NAME.Trim('"')
            break
        }
    }
    $osVersion = New-Object 'System.Version' -ArgumentList @($majorVer, $minorVer, $buildVer)

    return New-Object 'OSVersion.OSVersionInfo' -ArgumentList @($osDistro, $osVersion, $caption)
}

function WriteUnknownVersion () {
    return New-Object 'OSVersion.OSVersionInfo' ([OSVersion.Distributions]::Unknown, (New-Object 'System.Version' (0, 0, 0)), '')
}
