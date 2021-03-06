BeforeAll {
    $RootPath = Join-Path (Split-Path $PSScriptRoot -Parent) 'OSVersion'
    # OSVersion.Windows.ps1 is internal. so we need to dot source .ps1 file directly.
    Add-Type -Path (Join-Path $RootPath "OSVersionInfo.cs")
    . (Join-Path $RootPath 'OSVersion.Windows.ps1')
}

Describe "GetWindowsVersion function unit tests" {

    # Windows 10
    It "In the case of Windows 10 October 2020 Update (20H2)" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 19042);
                ProductType = 1;
                Caption     = 'Windows 10 20H2 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 2010, 0)
        $target.Name | Should -Be 'Windows 10 20H2 Test Edition' 
    }
    It "In the case of Windows 10 May 2020 Update" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 19041);
                ProductType = 1;
                Caption     = 'Windows 10 2004 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 2004, 0)
        $target.Name | Should -Be 'Windows 10 2004 Test Edition' 
    }
    It "In the case of Windows 10 November 2019 Update" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 18363);
                ProductType = 1;
                Caption     = 'Windows 10 1909 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 1909, 0)
        $target.Name | Should -Be 'Windows 10 1909 Test Edition' 
    }
    It "In the case of Windows 10 May 2019 Update" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 18362);
                ProductType = 1;
                Caption     = 'Windows 10 1903 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 1903, 0)
        $target.Name | Should -Be 'Windows 10 1903 Test Edition' 
    }
    It "In the case of Windows 10 October 2018 Update" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 17763);
                ProductType = 1;
                Caption     = 'Windows 10 1809 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 1809, 0)
        $target.Name | Should -Be 'Windows 10 1809 Test Edition' 
    }
    It "In the case of Windows 10 Spring Creators Update" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 17134);
                ProductType = 1;
                Caption     = 'Windows 10 1803 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 1803, 0)
        $target.Name | Should -Be 'Windows 10 1803 Test Edition' 
    }
    It "In the case of Windows 10 Fall Creators Update" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 16299);
                ProductType = 1;
                Caption     = 'Windows 10 1709 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 1709, 0)
        $target.Name | Should -Be 'Windows 10 1709 Test Edition' 
    }
    It "In the case of Windows 10 Creators Update" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 15063);
                ProductType = 1;
                Caption     = 'Windows 10 1703 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 1703, 0)
        $target.Name | Should -Be 'Windows 10 1703 Test Edition' 
    }
    It "In the case of Windows 10 Anniversary Update" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 14393);
                ProductType = 1;
                Caption     = 'Windows 10 1607 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 1607, 0)
        $target.Name | Should -Be 'Windows 10 1607 Test Edition' 
    }
    It "In the case of Windows 10 November Update" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 10586);
                ProductType = 1;
                Caption     = 'Windows 10 1511 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 1511, 0)
        $target.Name | Should -Be 'Windows 10 1511 Test Edition' 
    }
    It "In the case of Windows 10 Initial Release" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 10240);
                ProductType = 1;
                Caption     = 'Windows 10 1507 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (10, 1507, 0)
        $target.Name | Should -Be 'Windows 10 1507 Test Edition' 
    }

    # Windows Server LTSC / Windows Server SAC
    It "In the case of Windows Server 20H2" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 19042);
                ProductType = 3;
                Caption     = 'Windows Server Test Editon' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'WindowsServerSAC'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (2010, 1, 0)
        $target.Name | Should -Be 'Windows Server Test Editon' 
    }
    It "In the case of Windows Server 2004" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 19041);
                ProductType = 3;
                Caption     = 'Windows Server Test Editon' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'WindowsServerSAC'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (2004, 1, 0)
        $target.Name | Should -Be 'Windows Server Test Editon' 
    }
    It "In the case of Windows Server 1909" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 18363);
                ProductType = 3;
                Caption     = 'Windows Server Test Editon' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'WindowsServerSAC'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (1909, 1, 0)
        $target.Name | Should -Be 'Windows Server Test Editon' 
    }
    It "In the case of Windows Server 1903" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 18362);
                ProductType = 3;
                Caption     = 'Windows Server Test Editon' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'WindowsServerSAC'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (1903, 1, 0)
        $target.Name | Should -Be 'Windows Server Test Editon' 
    }
    It "In the case of Windows Server 2019" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 17763);
                ProductType = 3;
                Caption     = 'Windows Server 2019 Test Editon' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'WindowsServer'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (2019, 1, 0)
        $target.Name | Should -Be 'Windows Server 2019 Test Editon' 
    }
    It "In the case of Windows Server 1809" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 17763);
                ProductType = 3;
                Caption     = 'Windows Server Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'WindowsServerSAC'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (1809, 1, 0)
        $target.Name | Should -Be 'Windows Server Test Edition' 
    }
    It "In the case of Windows Server 1803" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 17134);
                ProductType = 3;
                Caption     = 'Windows Server 1803' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'WindowsServerSAC'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (1803, 1, 0)
        $target.Name | Should -Be 'Windows Server 1803' 
    }
    It "In the case of Windows Server 1709" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 16299);
                ProductType = 3;
                Caption     = 'Windows Server 1709' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'WindowsServerSAC'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (1709, 1, 0)
        $target.Name | Should -Be 'Windows Server 1709' 
    }
    It "In the case of Windows Server 2016" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (10, 0, 14393);
                ProductType = 3;
                Caption     = 'Windows Server 2016' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'WindowsServer'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (2016, 1, 0)
        $target.Name | Should -Be 'Windows Server 2016' 
    }

    # Windows 8.1
    It "In the case of Windows 8.1" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (6, 3, 9600);
                ProductType = 1;
                Caption     = 'Windows 8.1 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (8, 1, 0)
        $target.Name | Should -Be 'Windows 8.1 Test Edition' 
    }

    # Windows Server 2012 R2
    It "In the case of Windows Server 2012 R2" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (6, 3, 9600);
                ProductType = 3;
                Caption     = 'Windows Server 2012 R2 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'WindowsServer'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (2012, 2, 0)
        $target.Name | Should -Be 'Windows Server 2012 R2 Test Edition' 
    }

    # Windows 8
    It "In the case of Windows 8" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (6, 2, 9200);
                ProductType = 1;
                Caption     = 'Windows 8 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (8, 0, 0)
        $target.Name | Should -Be 'Windows 8 Test Edition' 
    }

    # Windows Server 2012
    It "In the case of Windows Server 2012" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (6, 2, 9200);
                ProductType = 3;
                Caption     = 'Windows Server 2012 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'WindowsServer'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (2012, 1, 0)
        $target.Name | Should -Be 'Windows Server 2012 Test Edition' 
    }

    # Windows 7
    It "In the case of Windows 7(SP1)" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (6, 1, 7601);
                ProductType = 1;
                Caption     = 'Windows 7(SP1) Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (7, 0, 1)
        $target.Name | Should -Be 'Windows 7(SP1) Test Edition' 
    }
    It "In the case of Windows 7" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (6, 1, 7600);
                ProductType = 1;
                Caption     = 'Windows 7 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (7, 0, 0)
        $target.Name | Should -Be 'Windows 7 Test Edition' 
    }

    # Windows Server 2008 R2
    It "In the case of Windows Server 2008 R2(SP1)" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (6, 1, 7601);
                ProductType = 3;
                Caption     = 'Windows Server 2008 R2(SP1) Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'WindowsServer'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (2008, 2, 1)
        $target.Name | Should -Be 'Windows Server 2008 R2(SP1) Test Edition' 
    }
    It "In the case of Windows Server 2008 R2" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (6, 1, 7600);
                ProductType = 3;
                Caption     = 'Windows Server 2008 R2 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'WindowsServer'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (2008, 2, 0)
        $target.Name | Should -Be 'Windows Server 2008 R2 Test Edition' 
    }

    # Windows Vista
    It "In the case of Windows Vista(SP2)" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (6, 0, 6002);
                ProductType = 1;
                Caption     = 'Windows Vista(SP2) Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (6, 0, 2)
        $target.Name | Should -Be 'Windows Vista(SP2) Test Edition' 
    }
    It "In the case of Windows Vista(SP1)" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (6, 0, 6001);
                ProductType = 1;
                Caption     = 'Windows Vista(SP1) Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (6, 0, 1)
        $target.Name | Should -Be 'Windows Vista(SP1) Test Edition' 
    }
    It "In the case of Windows Vista" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (6, 0, 6000);
                ProductType = 1;
                Caption     = 'Windows Vista Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'Windows'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (6, 0, 0)
        $target.Name | Should -Be 'Windows Vista Test Edition' 
    }

    # Windows Server 2008
    It "In the case of Windows Server 2008(SP2)" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (6, 0, 6002);
                ProductType = 3;
                Caption     = 'Windows Server 2008(SP2) Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'WindowsServer'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (2008, 1, 2)
        $target.Name | Should -Be 'Windows Server 2008(SP2) Test Edition' 
    }
    It "In the case of Windows Server 2008(SP1)" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (6, 0, 6001);
                ProductType = 3;
                Caption     = 'Windows Server 2008(SP1) Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'WindowsServer'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (2008, 1, 1)
        $target.Name | Should -Be 'Windows Server 2008(SP1) Test Edition' 
    }
    It "In the case of Windows Server 2008" {
        Mock -CommandName GetCimVersionInfo -MockWith {
            return [PSCustomObject]@{
                Version     = New-Object 'System.Version' (6, 0, 6000);
                ProductType = 3;
                Caption     = 'Windows Server 2008 Test Edition' 
            }
        }
        $target = GetWindowsVersion
        $target.Distribution | Should -Be 'WindowsServer'
        $target.Version.Major, $target.Version.Minor, $target.Version.Build | Should -Be (2008, 1, 0)
        $target.Name | Should -Be 'Windows Server 2008 Test Edition' 
    }

}