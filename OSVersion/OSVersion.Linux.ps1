<#
    Get Linux OS version
#>
function GetLinuxVersion () {
    if (-not (Test-Path -LiteralPath '/etc/os-release' -PathType Leaf)) {
        throw '/etc/os-release was not found.'
    }
    
    # get os basic information.
    $linuxInfo = Get-Content '/etc/os-release' -Raw | ConvertFrom-StringData
    $osDistro = [OSVersion.Distributions]::Unknown
    $majorVer, $minorVer, $buildVer = 0, 0, 0
    $caption = ''
    switch ($linuxInfo.ID) {
        'centos' {
            # CentOS
            $osDistro = [OSVersion.Distributions]::CentOS
            $majorVer, $minorVer, $buildVer = ( -split (Get-Content /etc/redhat-release))[3] -split '\.'
            $caption = $linuxInfo.PRETTY_NAME
            continue
        }
        'debian' {
            # Debian
            $osDistro = [OSVersion.Distributions]::Debian
            $majorVer, $minorVer = (Get-Content /etc/debian_version) -split '\.'
            $buildVer = 0
            $caption = $linuxInfo.PRETTY_NAME
            continue
        }
        'fedora' {
            # Fedora
            $osDistro = [OSVersion.Distributions]::Fedora
            $majorVer = $LinuxInfo.VERSION_ID
            $minorVer = 0
            $buildVer = 0
            $caption = $linuxInfo.PRETTY_NAME
            continue
        }
        'kali' { 
            # Kali
            $osDistro = [OSVersion.Distributions]::Kali
            $majorVer, $minorVer = $linuxInfo.VERSION_ID.Trim('"') -split '\.'
            $buildVer = 0
            $caption = $linuxInfo.PRETTY_NAME
            continue
        }
        'opensuse' { 
            # OpenSUSE
            $osDistro = [OSVersion.Distributions]::OpenSUSE
            $majorVer, $minorVer = $linuxInfo.VERSION_ID.Trim('"') -split '\.'
            $buildVer = 0
            $caption = $linuxInfo.PRETTY_NAME
            continue
        }
        'rhel' {
            # RHEL
            $osDistro = [OSVersion.Distributions]::RHEL
            $majorVer, $minorVer = $LinuxInfo.VERSION_ID -split '\.'
            $buildVer = 0
            $caption = $linuxInfo.PRETTY_NAME
            continue
        }
        'sles' { 
            # SLES
            $osDistro = [OSVersion.Distributions]::SLES
            $majorVer, $minorVer = $linuxInfo.VERSION_ID.Trim('"') -split '\.'
            $caption = $linuxInfo.PRETTY_NAME
            continue
        }
        'ubuntu' { 
            # Ubuntu
            $osDistro = [OSVersion.Distributions]::Ubuntu
            $majorVer, $minorVer = $linuxInfo.VERSION_ID.Trim('"') -split '\.'
            $buildVer = 0
            $caption = $linuxInfo.PRETTY_NAME
            continue
        }
        Default {
            $osDistro = [OSVersion.Distributions]::Unknown
            $majorVer, $minorVer, $buildVer = 0, 0, 0
            $caption = $linuxInfo.PRETTY_NAME
            continue
        }
    }
    $osVersion = New-Object 'System.Version' -ArgumentList @($majorVer, $minorVer, $buildVer)

    return New-Object 'OSVersion.OSVersionInfo' -ArgumentList @($osDistro, $osVersion, $caption)
}