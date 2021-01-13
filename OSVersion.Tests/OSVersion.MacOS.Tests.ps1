$RootPath = Join-Path (Split-Path $PSScriptRoot -Parent) 'OSVersion'
# OSVersion.MacOS.ps1 is internal. so we need to dot source .ps1 file directly.
Add-Type -Path (Join-Path $RootPath "OSVersionInfo.cs")
. (Join-Path $RootPath 'OSVersion.MacOS.ps1')

Describe "GetMacVersion function unit tests" {

    # macOS Mojave
    It "In the case of macOS Catalina (10.15)" {
        Mock -CommandName GetDarwinVersion -MockWith {
            return New-Object 'System.Version' (19, 0, 0);
        }
        Mock -CommandName GetOSCaption -MockWith {
            return 'macOS Catalina'
        }
        $target = GetMacVersion
        $target.Distribution | Should -Be 'MacOS'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 15, 0)
        $target.Name | Should -Be 'macOS Catalina' 
    }

    # macOS Mojave
    It "In the case of macOS Mojave (10.14)" {
        Mock -CommandName GetDarwinVersion -MockWith {
            return New-Object 'System.Version' (18, 0, 0);
        }
        Mock -CommandName GetOSCaption -MockWith {
            return 'macOS Mojave'
        }
        $target = GetMacVersion
        $target.Distribution | Should -Be 'MacOS'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 14, 0)
        $target.Name | Should -Be 'macOS Mojave' 
    }

    # macOS High Sierra
    It "In the case of macOS High Sierra (10.13.1)" {
        Mock -CommandName GetDarwinVersion -MockWith {
            return New-Object 'System.Version' (17, 2, 0);
        }
        Mock -CommandName GetOSCaption -MockWith {
            return 'macOS High Sierra 10.13.1'
        }
        $target = GetMacVersion
        $target.Distribution | Should -Be 'MacOS'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 13, 1)
        $target.Name | Should -Be 'macOS High Sierra 10.13.1' 
    }
    It "In the case of macOS High Sierra (10.13)" {
        Mock -CommandName GetDarwinVersion -MockWith {
            return New-Object 'System.Version' (17, 0, 0);
        }
        Mock -CommandName GetOSCaption -MockWith {
            return 'macOS High Sierra'
        }
        $target = GetMacVersion
        $target.Distribution | Should -Be 'MacOS'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 13, 0)
        $target.Name | Should -Be 'macOS High Sierra' 
    }

    # macOS Sierra
    It "In the case of macOS Sierra (10.12.2)" {
        Mock -CommandName GetDarwinVersion -MockWith {
            return New-Object 'System.Version' (16, 3, 0);
        }
        Mock -CommandName GetOSCaption -MockWith {
            return 'macOS High Sierra 10.12.2'
        }
        $target = GetMacVersion
        $target.Distribution | Should -Be 'MacOS'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 12, 2)
        $target.Name | Should -Be 'macOS High Sierra 10.12.2' 
    }
    It "In the case of macOS Sierra (10.12.1)" {
        Mock -CommandName GetDarwinVersion -MockWith {
            return New-Object 'System.Version' (16, 1, 0);
        }
        Mock -CommandName GetOSCaption -MockWith {
            return 'macOS High Sierra 10.12.1'
        }
        $target = GetMacVersion
        $target.Distribution | Should -Be 'MacOS'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 12, 1)
        $target.Name | Should -Be 'macOS High Sierra 10.12.1' 
    }
    It "In the case of macOS Sierra (10.12)" {
        Mock -CommandName GetDarwinVersion -MockWith {
            return New-Object 'System.Version' (16, 0, 0);
        }
        Mock -CommandName GetOSCaption -MockWith {
            return 'macOS High Sierra 10.12'
        }
        $target = GetMacVersion
        $target.Distribution | Should -Be 'MacOS'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 12, 0)
        $target.Name | Should -Be 'macOS High Sierra 10.12' 
    }

    # OSX El Capitan (10.11)
    It "In the case of OSX El Capitan (10.11.2)" {
        Mock -CommandName GetDarwinVersion -MockWith {
            return New-Object 'System.Version' (15, 2, 0);
        }
        Mock -CommandName GetOSCaption -MockWith {
            return 'macOS High Sierra 10.11.2'
        }
        $target = GetMacVersion
        $target.Distribution | Should -Be 'MacOS'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 11, 2)
        $target.Name | Should -Be 'macOS High Sierra 10.11.2' 
    }
    It "In the case of OSX El Capitan (10.11.1)" {
        Mock -CommandName GetDarwinVersion -MockWith {
            return New-Object 'System.Version' (15, 0, 0);
        }
        Mock -CommandName GetBuildVersion -MockWith {
            return '15B42'
        }
        Mock -CommandName GetOSCaption -MockWith {
            return 'macOS High Sierra 10.11.1'
        }
        $target = GetMacVersion
        $target.Distribution | Should -Be 'MacOS'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 11, 1)
        $target.Name | Should -Be 'macOS High Sierra 10.11.1' 
    }
    It "In the case of OSX El Capitan (10.11)" {
        Mock -CommandName GetDarwinVersion -MockWith {
            return New-Object 'System.Version' (15, 0, 0);
        }
        Mock -CommandName GetBuildVersion -MockWith {
            return ''
        }
        Mock -CommandName GetOSCaption -MockWith {
            return 'macOS High Sierra 10.11'
        }
        $target = GetMacVersion
        $target.Distribution | Should -Be 'MacOS'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 11, 0)
        $target.Name | Should -Be 'macOS High Sierra 10.11' 
    }

}