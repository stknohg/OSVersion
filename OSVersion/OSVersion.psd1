@{
    ModuleVersion     = '1.6.1'
    GUID              = 'e4ef3bd4-556d-4d92-9a15-4179784bd1a4'
    Author            = 'stknohg'
    CompanyName       = 'stknohg'
    Copyright         = '(c) stknohg. All rights reserved.'
    Description       = 'PowerShell module for getting OS version information.'
    PowerShellVersion = '3.0'
    FormatsToProcess  = @('OSVersion.format.ps1xml')
    NestedModules     = @('OSVersion.psm1')
    FunctionsToExport = @('Get-OSVersion')
    CmdletsToExport   = @()
    VariablesToExport = '*'
    AliasesToExport   = @()
    PrivateData       = @{
        PSData = @{
            LicenseUri = 'https://github.com/stknohg/OSVersion/blob/master/LICENSE'
            ProjectUri = 'https://github.com/stknohg/OSVersion'
        }
    }
}

