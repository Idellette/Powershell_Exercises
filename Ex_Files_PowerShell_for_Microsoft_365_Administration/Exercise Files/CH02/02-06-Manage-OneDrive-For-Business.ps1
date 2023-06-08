# Retrieve All Site Collections including OneDrive for Business
Get-SPOSite `
    -Detailed `
    -IncludePersonalSite $true | `
        Format-Table –AutoSize


# Retrieve OneDrive for Business Sites Collections
Get-SPOSite `
    -Limit ALL `
    -IncludePersonalSite $true `
    -Filter "Url -like '-my.sharepoint.com/personal/'"


# Retrieve a Single OneDrive for Business Site
$login = "<login>"
$user = $login.Replace('@','_').Replace('.','_')

Get-SPOSite `
    -Limit ALL `
    -IncludePersonalSite $true `
    -Filter "Url -like '-my.sharepoint.com/personal/$user'"


# View Single OneDrive for Business Site Storage
$login = "<login>"
$user = $login.Replace('@','_').Replace('.','_')

Get-SPOSite `
    -Limit ALL `
    -IncludePersonalSite $true `
    -Filter "Url -like '-my.sharepoint.com/personal/$user'" `
    -Detailed | `
        Select-Object url, storageusagecurrent, Owner


# Add a Site Collection Administrator to all OneDrive for Business Sites
$adminuser = "<adminuser>"

$sites = Get-SPOSite `
            -Limit ALL `
            -IncludePersonalSite $true `
            -Filter "Url -like '-my.sharepoint.com/personal/'"

foreach($site in $sites)
{
    Set-SPOUser `
        -Site $site.Url `
        -LoginName $adminuser `
        -IsSiteCollectionAdmin $true
}


# Update Storage for a OneDrive for Business Site
$login = "<login>"
$user = $login.Replace('@','_').Replace('.','_')
$storagequota = "<storagequota>"
$storagequotawarning = "<storagequotawarning>"

$onedrivesite = Get-SPOSite `
    -Limit ALL `
    -IncludePersonalSite $true `
    -Filter "Url -like '-my.sharepoint.com/personal/$user'" 

Set-SPOSite `
    -Identity $onedrivesite `
    -StorageQuota $storagequota `
    -StorageQuotaWarningLevel $storagequotawarning 


# Pre-provision OneDrive for Business Sites
$users = @()

$users += "psuser1@m365x296267.onmicrosoft.com"
$users += "psuser2@m365x296267.onmicrosoft.com"
$users += "psuser3@m365x296267.onmicrosoft.com"

Request-SPOPersonalSite `
    -UserEmails $users


# Restore a Deleted OneDrive for Business Site
$deleteonedrivesite = Get-SPODeletedSite `
    -IncludeOnlyPersonalSite | `
        Format-Table url

Restore-SPODeletedSite `
    -Identity $deleteonedrivesite.Url
