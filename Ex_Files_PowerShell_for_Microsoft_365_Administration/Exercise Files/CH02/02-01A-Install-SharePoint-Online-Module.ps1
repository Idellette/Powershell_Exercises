# Check if SharePoint PowerShell Module is Loaded
Get-Module -Name Microsoft.Online.SharePoint.PowerShell `
    -ListAvailable | Select-Object Name, Version


# Install SharePoint PowerShell Module
Install-Module -Name Microsoft.Online.SharePoint.PowerShell


# Import SharePoint PowerShell Module
Import-Module -Name Microsoft.Online.SharePoint.PowerShell
