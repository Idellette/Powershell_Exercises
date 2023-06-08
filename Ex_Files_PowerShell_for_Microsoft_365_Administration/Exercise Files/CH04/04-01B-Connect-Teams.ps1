# Connect with Username and Password
$user = "<User>"
$creds = Get-Credential `
    -UserName $user `
    -Message "Enter User Password"

Connect-MicrosoftTeams `
    -Credential $creds


# Connect with Multi-factor Authentication (Browser Prompt)
Connect-MicrosoftTeams


# Connect with Credentials using Paramters
$Params = @{
    "Credential" = (Get-Credential)
}

Connect-MicrosoftTeams @Params  


# Connect with Microsoft Graph
Connect-MsGraph `
    -scopes "TeamsActivity.Read" `
            "TeamsActivity.Send" `
            "TeamsApp.ReadWrite.All" `
            "TeamsAppInstallation.ReadWriteForChat" `
            "TeamsAppInstallation.ReadWriteForTeam" `
            "TeamsAppInstallation.ReadWriteForUser" `
            "TeamsAppInstallation.ReadWriteSelfForChat" `
            "TeamsAppInstallation.ReadWriteSelfForTeam" `
            "TeamsAppInstallation.ReadWriteSelfForUser" `
            "TeamSettings.ReadWrite.All" `
            "TeamsTab.ReadWrite.All" `
            "TeamsTab.ReadWriteForChat" `
            "TeamsTab.ReadWriteForTeam" `
            "TeamsTab.ReadWriteForUser"
