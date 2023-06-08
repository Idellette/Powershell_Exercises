# Connect with Username and Password
$user = "<User>"
$creds = Get-Credential -UserName $user

Connect-ExchangeOnline `
    -Credential $creds


# Connect with Multi-factor Authentication (Browser Prompt)
Connect-ExchangeOnline


# Connect by Passing in the Username
$user = "<User>"

Connect-ExchangeOnline `
    -UserPrincipalName $user


# Connect with Credentials using Paramters
$Params = @{
    "Credential" = (Get-Credential)
}

Connect-ExchangeOnline @Params  


# Connect to Exchange Online using Microsoft Graph PowerShell
Connect-MgGraph -Scopes `
        "User.ReadWrite.All", `
        "email", `
        "Mail.ReadWrite", `
        "Mail.ReadWrite.Shared", `
        "MailboxSettings.ReadWrite", `
        "Contacts.ReadWrite", `
        "Contacts.ReadWrite.Shared"
