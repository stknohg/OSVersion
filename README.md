# OSVersion

![build](https://github.com/stknohg/OSVersion/workflows/build/badge.svg)

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

## Version list 

The list of `Distribution` and `Version` properties values.

### Windows 

|OS, distribution name|Distribution<br>property value|Version<br>(Major)|Version<br>(Minor)|Version<br>(Build)|Remarks|
|----|----|----|----|----|----|
|[EOL] Windows Vista|Windows|6|0|0 - 2|Assign SP to build version|
|[EOL] Windows 7|Windows|7|0|0 - 1|Assign SP to build version|
|[EOL] Windows 8|Windows|8|0|0||
|Windows 8.1|Windows|8|1|0||
|Windows 10 Initial release (1507)|Windows|10|1507|0||
|[EOL] Windows 10 November update (1511)|Windows|10|1511|0||
|Windows 10 Anniversary Update (1607)|Windows|10|1607|0||
|[EOL] Windows 10 Creators Update (1703)|Windows|10|1703|0||
|[EOL] Windows 10 Fall Creators Update (1709)|Windows|10|1709|0||
|Windows 10 Spring Creators Update (1803)|Windows|10|1803|0||
|Windows 10 October 2018 Update (1809)|Windows|10|1809|0||
|[EOL] Windows 10 May 2019 Update (1903)|Windows|10|1903|0||
|Windows 10 November 2019 Update (1909)|Windows|10|1909|0||
|Windows 10 May 2020 Update (2004)|Windows|10|2004|0||
|Windows 10 October 2020 Update (20H2)|Windows|10|2010|0||
|[EOL] Windows Server 2008|WindowsServer|2008|1|0 - 2|Assign SP to build version|
|[EOL] Windows Server 2008 R2|WindowsServer|2008|2|0 - 1|Assign SP to build version|
|Windows Server 2012|WindowsServer|2012|1|0 - 1|Assign SP to build version|
|Windows Server 2012 R2|WindowsServer|2012|2|0||
|Windows Server 2016|WindowsServer|2016|1|0||
|Windows Server 2019|WindowsServer|2019|1|0||
|[EOL] Windows Server 1709|WindowsServerSAC|1709|1|0||
|[EOL] Windows Server 1803|WindowsServerSAC|1803|1|0||
|Windows Server 1809|WindowsServerSAC|1809|1|0||
|Windows Server 1903|WindowsServerSAC|1903|1|0||
|Windows Server 1909|WindowsServerSAC|1909|1|0||
|Windows Server 2004|WindowsServerSAC|2004|1|0||
|Windows Server 20H2|WindowsServerSAC|2010|1|0||

### macOS

|OS, distribution name|Distribution<br>property value|Version<br>(Major)|Version<br>(Minor)|Version<br>(Build)|Remarks|
|----|----|----|----|----|----|
|[EOL] macOS Sierra (10.12)|MacOS|10|12|0 - 6||
|macOS High Sierra (10.13)|MacOS|10|13|0 - 6||
|macOS Mojave (10.14)|MacOS|10|14|0 - ||
|macOS Catalina (10.15)|MacOS|10|15|0 - ||

### Linux

|OS, distribution name|Distribution<br>property value|Version<br>(Major)|Version<br>(Minor)|Version<br>(Build)|Remarks|
|----|----|----|----|----|----|
|CentOS 7 - |CentOS|7 - |0 - | 0 - ||
|[EOL] Debian 8|Debian|8|0 - 8|0||
|Debian 9 - |Debian|9 -|0 - |0||
|Fedora 27 - |Fedora|27 -|0|0||
|Kali Linux 2018.1|Kali|2018|1|0||
|openSUSE Leap 42|OpenSUSE|14|42|1 - 3||
|Red Hat Enterprise Linux 7 -|RHEL|7 - |1 - |0||
|SUSE Linux Enterprise Server 12|SLES|12|0 - 3|0||
|[EOL] Ubuntu 14|Ubuntu|14|4,10|0 - |Assign LTS point release to build version.|
|Ubuntu 16|Ubuntu|16|4,10|0 - |Assign LTS point release to build version.|
|Ubuntu 18|Ubuntu|18|4|0 - |Assign LTS point release to build version.|
|Ubuntu 20|Ubuntu|20|4|0 - |Assign LTS point release to build version.|
|Others|Unknown|0|0|0||