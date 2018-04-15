# OSVersion

[![Build status](https://ci.appveyor.com/api/projects/status/ap98gg1ir7hb7pbx?svg=true)](https://ci.appveyor.com/project/stknohg/osversion)

PowerShell module for getting OS version information.

## How to install

You can install it from [PowerShell gallery](https://www.powershellgallery.com/packages/OSVersion).

```powershell
Install-Module OSVersion -Scope CurrentUser
```

## Usage

### Get-OSVersion

Get OS version information.

```powershell
Get-OSVersion
```

This cmdlet returns a single `OSVersion.OSVersionInfo` type value.

`OSVersion.OSVersionInfo` class has follow properties.

|Property|Type|Description|
|----|----|----|
|Distribution|OSVersion.Distributions|Enums of OS and distoributions.|
|Version|System.Version|Original OS version information.|
|Name|System.String|OS name.|

#### Version list 

The list of `Distribution` and `Version` properties values.

|OS, distribution name|Distribution<br>property value|Version<br>(Major)|Version<br>(Minor)|Version<br>(Build)|Remarks|
|----|----|----|----|----|----|
|Windows Vista|Windows|6|0|0 - 2|Assign SP to build version|
|Windows 7|Windows|7|0|0 - 1|Assign SP to build version|
|Windows 8|Windows|8|0|0||
|Windows 8.1|Windows|8|1|0||
|Windows 10 Initial release (1507)|Windows|10|1507|0||
|Windows 10 November update (1511)|Windows|10|1511|0||
|Windows 10 Anniversary Update (1607)|Windows|10|1607|0||
|Windows 10 Creators Update (1703)|Windows|10|1703|0||
|Windows 10 Fall Creators Update (1709)|Windows|10|1709|0||
|Windows 10 Spring Creators Update (1803)|Windows|10|1803|0||
|Windows Server 2008|WindowsServer|2008|1|0 - 2|Assign SP to build version|
|Windows Server 2008 R2|WindowsServer|2008|2|0 - 1|Assign SP to build version|
|Windows Server 2012|WindowsServer|2012|1|0 - 1|Assign SP to build version|
|Windows Server 2012 R2|WindowsServer|2012|2|0||
|Windows Server 2016|WindowsServer|2016|1|0||
|Windows Server 2019|WindowsServer|2019|1|0||
|Windows Server 1709|WindowsServerSAC|1709|1|0||
|Windows Server 1803|WindowsServerSAC|1803|1|0||
|OS X El Capitan (10.11)|MacOS|10|11|0 - 6|PowerShell Core does not support this version.|
|macOS Sierra (10.12)|MacOS|10|12|0 - 6||
|macOS High Sierra (10.13)|MacOS|10|13|0 - ||
|CentOS 7|CentOS|7|0 - |1406 - ||
|Debian 8|Debian|8|0 - 8|0||
|Debian 9|Debian|9|0 - |0||
|Fedora 25|Fedora|25|0|0||
|Fedora 26|Fedora|26|0|0||
|Kali Linux 2018.1|Kali|2018|1|0||
|openSUSE Leap 42|OpenSUSE|14|42|1 - 3||
|Red Hat Enterprise Linux 7|RHEL|7|1 - |0||
|SUSE Linux Enterprise Server 12|SLES|12|0 - 3|0||
|Ubuntu 14|Ubuntu|14|4,10|0 - 5|Assign LTS point release to build version.|
|Ubuntu 15|Ubuntu|15|4,10|0|PowerShell Core does not support this version.|
|Ubuntu 16|Ubuntu|16|4,10|0 - 3|Assign LTS point release to build version.|
|Ubuntu 17|Ubuntu|17|4,10|0||
|Others|Unknown|0|0|0||