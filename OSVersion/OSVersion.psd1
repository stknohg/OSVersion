@{

    # Version number of this module.
    ModuleVersion     = '1.2.0'

    # ID used to uniquely identify this module
    GUID              = 'e4ef3bd4-556d-4d92-9a15-4179784bd1a4'

    # Author of this module
    Author            = 'stknohg'

    # Company or vendor of this module
    CompanyName       = 'stknohg'

    # Copyright statement for this module
    Copyright         = '(c) stknohg. All rights reserved.'

    # Description of the functionality provided by this module
    Description       = 'PowerShell module for getting OS version information.'

    # Minimum version of the PowerShell engine required by this module
    PowerShellVersion = '3.0'

    # Format files (.ps1xml) to be loaded when importing this module
    FormatsToProcess  = @('OSVersion.format.ps1xml')

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    NestedModules     = @('OSVersion.psm1')

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @('Get-OSVersion')

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport   = @()

    # Variables to export from this module
    VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport   = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData       = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            # Tags = @('')

            # A URL to the license for this module.
            LicenseUri = 'https://github.com/stknohg/OSVersion/blob/master/LICENSE'

            # A URL to the main website for this project.
            ProjectUri = 'https://github.com/stknohg/OSVersion'

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
            # ReleaseNotes = ''

        } # End of PSData hashtable

    } # End of PrivateData hashtable

}

