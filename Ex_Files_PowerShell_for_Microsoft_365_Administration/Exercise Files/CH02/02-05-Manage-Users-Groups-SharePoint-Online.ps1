# View All Users in a Site Collection
$url = "<url>"
 	
Get-SPOUser `
    –Site $url

# Generate a User Report
$url = "<url>"

Get-SPOUser `
    -Site $url | `
        Select-Object LoginName, IsSiteAdmin, Groups, UserType | `
            Format-Table -Wrap -AutoSize

# Add User to Group in SharePoint Online Site
$url = "<url>"
$user = "<user>" 
$group = "<group>"
  
Add-SPOUser `
    -Site "https://$tenant.sharepoint.com/sites/$site" `
    -LoginName $user `
    -Group $group


# Add User as a Site Collection Administrator
$user = "<user>"
$url = "<url>"

Set-SPOUser `
    -Site $url `
    -LoginName $user `
    -IsSiteCollectionAdmin $true


# Remove Specified User from Group within Site Collection
$url = "<url>"
$user = "<user>" 
$group = "<group>"

Remove-SPOUser `
    -Site $url `
    -LoginName $user `
    -Group $group