# Check if SharePoint PowerShell Module is Loaded
Get-Module -Name MicrosoftTeams `
    -ListAvailable | Select-Object Name, Version


# Install SharePoint PowerShell Module
Install-Module -Name MicrosoftTeams


# Import SharePoint PowerShell Module
Import-Module -Name MicrosoftTeams
