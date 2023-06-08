# Connect with Username and Password
$user = "<User>"
$tenant = "<Tenant>"
$creds = Get-Credential -UserName $user

Connect-SPOService `
	-Url https://$tenant-admin.sharepoint.com `
	-Credential $creds


# Connect with Multi-factor Authentication (Browser Prompt)
$tenant = "<Tenant>"
Connect-SPOService `
    -Url https://$tenant-admin.sharepoint.com


# Connect with Credentials using Paramters
$Params = @{
    "Url" = 'https://$tenant-admin.sharepoint.com'
    "Credential" = (Get-Credential)
}

Connect-SPOService @Params  
