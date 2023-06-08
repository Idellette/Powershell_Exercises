# Connect using Exchange Online Basic Authentication
$user = "<User>"
$creds = Get-Credential -UserName $user

$session = New-PSSession `
            -ConfigurationName Microsoft.Exchange `
            -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ `
            -Credential $creds `
            -Authentication Basic `
            -AllowRedirection

Import-PSSession $session `
    -DisableNameChecking


# Connect using Exchange Online Module (Browser)
$user = "<User>"

Connect-IPPSSession `
    -UserPrincipalName $user


# Connect using Exchange Online Module with Credentials
$user = "<User>"
$creds = Get-Credential -UserName $user

Connect-IPPSSession `
    -Credential $creds


# Connect using Microsoft Graph
Connect-MgGraph –Scopes `
	"SecurityActions.ReadWrite.All", `
	"SecurityEvents.ReadWrite.All", `
	"Policy.ReadWrite.ConditionalAccess", `
	"eDiscovery.ReadWrite.All"
