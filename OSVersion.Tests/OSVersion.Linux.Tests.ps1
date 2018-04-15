$RootPath = Join-Path (Split-Path $PSScriptRoot -Parent) 'OSVersion'
# OSVersion.Linux.ps1 is internal. so we need to dot source .ps1 file directly.
Add-Type -Path (Join-Path $RootPath "OSVersionInfo.cs")
. (Join-Path $RootPath 'OSVersion.Linux.ps1')

Describe "GetLinuxVersion function unit tests" {

    It "Should return unknown verion when '/etc/os-release' was not found" {
        Mock -CommandName 'Test-Path' -ParameterFilter { $LiteralPath -eq '/etc/os-release' -and $PathType -eq 'Leaf' } -MockWith { return $false }
        $target = GetLinuxVersion
        $target.Distribution | Should -Be 'Unknown'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (0, 0, 0)
        $target.Name | Should -Be '' 
    }

    # CentOS
    It "In the case of CentOS" {
        Mock -CommandName 'Test-Path' -ParameterFilter { $LiteralPath -eq '/etc/os-release' -and $PathType -eq 'Leaf' } -MockWith { return $true }
        Mock -CommandName 'Get-Content' -ParameterFilter { $Path -eq '/etc/os-release' } -MockWith {
            return @"
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="7"
PRETTY_NAME="CentOS Linux 7 (Core)"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:centos:centos:7"
HOME_URL="https://www.centos.org/"
BUG_REPORT_URL="https://bugs.centos.org/"

CENTOS_MANTISBT_PROJECT="CentOS-7"
CENTOS_MANTISBT_PROJECT_VERSION="7"
REDHAT_SUPPORT_PRODUCT="centos"
REDHAT_SUPPORT_PRODUCT_VERSION="7"
"@
        }
        Mock -CommandName 'Get-Content' -ParameterFilter { $Path -eq '/etc/redhat-release' } -MockWith {
            return 'CentOS Linux release 7.4.1708 (Core)'
        }

        $target = GetLinuxVersion
        $target.Distribution | Should -Be 'CentOS'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (7, 4, 1708)
        $target.Name | Should -Be 'CentOS Linux 7 (Core)' 
    }
    
    # Debian
    It "In the case of Debian" {
        Mock -CommandName 'Test-Path' -ParameterFilter { $LiteralPath -eq '/etc/os-release' -and $PathType -eq 'Leaf' } -MockWith { return $true }
        Mock -CommandName 'Get-Content' -ParameterFilter { $Path -eq '/etc/os-release' } -MockWith {
            return @"
PRETTY_NAME="Debian GNU/Linux 9 (stretch)"
NAME="Debian GNU/Linux"
VERSION_ID="9"
VERSION="9 (stretch)"
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
"@
        }
        Mock -CommandName 'Get-Content' -ParameterFilter { $Path -eq '/etc/debian_version' } -MockWith {
            return '9.3'
        }

        $target = GetLinuxVersion
        $target.Distribution | Should -Be 'Debian'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (9, 3, 0)
        $target.Name | Should -Be 'Debian GNU/Linux 9 (stretch)' 
    }

    # Fedora
    It "In the case of Fedora" {
        Mock -CommandName 'Test-Path' -ParameterFilter { $LiteralPath -eq '/etc/os-release' -and $PathType -eq 'Leaf' } -MockWith { return $true }
        Mock -CommandName 'Get-Content' -ParameterFilter { $Path -eq '/etc/os-release' } -MockWith {
            return @"
NAME=Fedora
VERSION="26 (Twenty Six)"
ID=fedora
VERSION_ID=26
PRETTY_NAME="Fedora 26 (Twenty Six)"
ANSI_COLOR="0;34"
CPE_NAME="cpe:/o:fedoraproject:fedora:26"
HOME_URL="https://fedoraproject.org/"
BUG_REPORT_URL="https://bugzilla.redhat.com/"
REDHAT_BUGZILLA_PRODUCT="Fedora"
REDHAT_BUGZILLA_PRODUCT_VERSION=26
REDHAT_SUPPORT_PRODUCT="Fedora"
REDHAT_SUPPORT_PRODUCT_VERSION=26
PRIVACY_POLICY_URL=https://fedoraproject.org/wiki/Legal:PrivacyPolicy
"@
        }

        $target = GetLinuxVersion
        $target.Distribution | Should -Be 'Fedora'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (26, 0, 0)
        $target.Name | Should -Be 'Fedora 26 (Twenty Six)' 
    }

    # Kali
    It "In the case of Kali Linux" {
        Mock -CommandName 'Test-Path' -ParameterFilter { $LiteralPath -eq '/etc/os-release' -and $PathType -eq 'Leaf' } -MockWith { return $true }
        Mock -CommandName 'Get-Content' -ParameterFilter { $Path -eq '/etc/os-release' } -MockWith {
            return @"
PRETTY_NAME="Kali GNU/Linux Rolling"
NAME="Kali GNU/Linux"
ID=kali
VERSION="2018.1"
VERSION_ID="2018.1"
ID_LIKE=debian
ANSI_COLOR="1;31"
HOME_URL="http://www.kali.org/"
SUPPORT_URL="http://forums.kali.org/"
BUG_REPORT_URL="http://bugs.kali.org/"
"@
        }

        $target = GetLinuxVersion
        $target.Distribution | Should -Be 'Kali'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (2018, 1, 0)
        $target.Name | Should -Be 'Kali GNU/Linux Rolling' 
    }

    # openSUSE
    It "In the case of openSUSE" {
        Mock -CommandName 'Test-Path' -ParameterFilter { $LiteralPath -eq '/etc/os-release' -and $PathType -eq 'Leaf' } -MockWith { return $true }
        Mock -CommandName 'Get-Content' -ParameterFilter { $Path -eq '/etc/os-release' } -MockWith {
            return @"
NAME="openSUSE Leap"
VERSION="42.3"
ID=opensuse
ID_LIKE="suse"
VERSION_ID="42.3"
PRETTY_NAME="openSUSE Leap 42.3"
ANSI_COLOR="0;32"
CPE_NAME="cpe:/o:opensuse:leap:42.3"
BUG_REPORT_URL="https://bugs.opensuse.org"
HOME_URL="https://www.opensuse.org/"
"@
        }

        $target = GetLinuxVersion
        $target.Distribution | Should -Be 'OpenSuse'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (14, 42, 3)
        $target.Name | Should -Be 'openSUSE Leap 42.3' 
    }

    # RHEL
    It "In the case of RHEL" {
        Mock -CommandName 'Test-Path' -ParameterFilter { $LiteralPath -eq '/etc/os-release' -and $PathType -eq 'Leaf' } -MockWith { return $true }
        Mock -CommandName 'Get-Content' -ParameterFilter { $Path -eq '/etc/os-release' } -MockWith {
            return @"
NAME="Red Hat Enterprise Linux Server"
VERSION="7.4 (Maipo)"
ID="rhel"
ID_LIKE="fedora"
VARIANT="Server"
VARIANT_ID="server"
VERSION_ID="7.4"
PRETTY_NAME="Red Hat Enterprise Linux Server 7.4 (Maipo)"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:redhat:enterprise_linux:7.4:GA:server"
HOME_URL="https://www.redhat.com/"
BUG_REPORT_URL="https://bugzilla.redhat.com/"
    
REDHAT_BUGZILLA_PRODUCT="Red Hat Enterprise Linux 7"
REDHAT_BUGZILLA_PRODUCT_VERSION=7.4
REDHAT_SUPPORT_PRODUCT="Red Hat Enterprise Linux"
REDHAT_SUPPORT_PRODUCT_VERSION="7.4"
"@
        }

        $target = GetLinuxVersion
        $target.Distribution | Should -Be 'RHEL'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (7, 4, 0)
        $target.Name | Should -Be 'Red Hat Enterprise Linux Server 7.4 (Maipo)' 
    }

    # SLES
    It "In the case of SLES" {
        Mock -CommandName 'Test-Path' -ParameterFilter { $LiteralPath -eq '/etc/os-release' -and $PathType -eq 'Leaf' } -MockWith { return $true }
        Mock -CommandName 'Get-Content' -ParameterFilter { $Path -eq '/etc/os-release' } -MockWith {
            return @"
NAME="SLES"
VERSION="12-SP3"
VERSION_ID="12.3"
PRETTY_NAME="SUSE Linux Enterprise Server 12 SP3"
ID="sles"
ANSI_COLOR="0;32"
CPE_NAME="cpe:/o:suse:sles:12:sp3"
"@
        }

        $target = GetLinuxVersion
        $target.Distribution | Should -Be 'SLES'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (12, 3, 0)
        $target.Name | Should -Be 'SUSE Linux Enterprise Server 12 SP3' 
    }

    # Ubuntu
    It "In the case of Ubuntu" {
        Mock -CommandName 'Test-Path' -ParameterFilter { $LiteralPath -eq '/etc/os-release' -and $PathType -eq 'Leaf' } -MockWith { return $true }
        Mock -CommandName 'Get-Content' -ParameterFilter { $Path -eq '/etc/os-release' } -MockWith {
            return @"
NAME="Ubuntu"
VERSION="16.04.3 LTS (Xenial Xerus)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 16.04.3 LTS"
VERSION_ID="16.04"
HOME_URL="http://www.ubuntu.com/"
SUPPORT_URL="http://help.ubuntu.com/"
BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
VERSION_CODENAME=xenial
UBUNTU_CODENAME=xenial
"@
        }

        $target = GetLinuxVersion
        $target.Distribution | Should -Be 'Ubuntu'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (16, 4, 3)
        $target.Name | Should -Be 'Ubuntu 16.04.3 LTS' 
    }

}