# Retrieve Site Collections
Get-SPOSite -Detailed | Format-Table –AutoSize


# Retrieve Team Connected Sites Collections
Get-SPOSite `
    -Limit ALL | `
        Where-Object { $_.IsTeamsConnected -eq $true }


# Retrieve Group Connected Sites Collections
Get-SPOSite `
    -Limit ALL `
    -GroupIdDefined $true


# Create New Site Collection
$owner = "<owner>"
$storagequota = "<storagequota>"
$url = "<url>"
$template = "<template>"
$title = "<title>"

New-SPOSite `
	-Owner $owner `
	-StorageQuota $storagequota `
	-Url $url `
	-NoWait `
	-Template $template `
	-Title $title


# Update the Owner of a Site Collection
$user = "<user>"
$tenant = "<tenant>"
$site = "<site>"

Set-SPOSite `
        -Identity "https://$tenant.sharepoint.com/sites/$site" `
        -Owner $user `
        -NoWait
    

# Remove Site Collection
$tenant = "<tenant>"
$site = "<site>"

Remove-SPOSite `
    -Identity "https://$tenant.sharepoint.com/sites/$site" `
    -NoWait