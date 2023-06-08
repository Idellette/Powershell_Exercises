# Check if SharePoint PowerShell Module is Loaded
Get-Module -Name ExchangeOnlineManagement `
    -ListAvailable | Select-Object Name, Version


# Install Exchange v2 PowerShell Module
Install-Module -Name ExchangeOnlineManagement


# Import Exchange v2 PowerShell Module
Import-Module -Name ExchangeOnlineManagement


# Install and Import the Microsoft Graph PowerShell Module
Install-Module Microsoft.Graph
Select-MgProfile -Name "beta"
Import-Module Microsoft.Graph


