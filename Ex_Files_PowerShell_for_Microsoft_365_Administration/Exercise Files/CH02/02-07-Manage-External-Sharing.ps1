# Retrieve 50 External users
Get-SPOExternalUser `
    –PageSize 50


# Retrieve 30 External users from Specified Site
$url = "<url>"

Get-SPOExternalUser `
    -Position 0 `
    -PageSize 30 `
    -SiteUrl $url


# Retrieve Sharing Status for Specified Site
$url = "<url>"

Get-SPOSite `
    -Identity $url `
    -DisableSharingForNonOwnersStatus


# Add an External User
$group = "<group>"
$email = "<email>"

Add-SPOUser `
    -Group $group `
    -LoginName $email 


# View External Sharing
Get-SPOSite | Select-object url, sharingcapability


# View All Site Collections where External Sharing is Enabled
$sites = Get-SPOSite `
    -IncludePersonalSite $false | `
        Where-Object { $_.SharingCapability -ne "Disabled" }

foreach ($site in $sites)
{
   Write-Host $site.Url
}


# Disable Sharing
$url = "<url>"

Set-SPOSite `
    -Identity $url `
    -SharingCapability 'Disabled'


# Set Sharing to only Authenticated Users
$url = "<url>"

Set-SPOSite `
    -Identity $url `
    -SharingCapability 'ExternalUserSharingOnly'

    
# Set Sharing to Anonymous
$url = "<url>"

Set-SPOSite `
    -Identity $url `
    -SharingCapability 'ExternalUserAndGuestSharing'