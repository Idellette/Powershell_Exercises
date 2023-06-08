# Retrieve Specific Team Channels
$teamname = "<teamname>"

$team = Get-Team `
            -DisplayName $teamname 

Get-TeamChannel `
    -GroupId $team.GroupId

Get-TeamChannel `
    -GroupId $team.GroupId `
    -MembershipType Private

# Retrieve Onwers of Teams Channel (Preview)
Install-Module -Name MicrosoftTeams -RequiredVersion 2.5.2-preview -AllowPrerelease

$teamname = "<teamname>"

$team = Get-Team `
            -DisplayName $teamname

$channel = Get-TeamChannel `
            -GroupId $team.GroupId

Get-TeamChannelUser `
    -GroupId $team.GroupId `
    -DisplayName $channel.DisplayName `
    -Role Owner


# Create Teams Channel
$teamname = "<teamname>"
$channelname = "<channelname>"

$team = Get-Team `
            -DisplayName $teamname

New-TeamChannel `
    -GroupId $team.GroupId `
    -DisplayName $channelname

New-TeamChannel `
    -GroupId $team.GroupId `
    -DisplayName $channelname `
    -MembershipType Private


# Update Teams Channel
$teamname = "<teamname>"
$channelname = "<channelname>"
$newchannelname = "<newchannelname>"

$team = Get-Team `
            -DisplayName $teamname

$channel = Get-TeamChannel `
            -GroupId $team.GroupId

Set-TeamChannel `
    -GroupId $team.GroupId `
    -CurrentDisplayName $channelname `
    -NewDisplayName $newchannelname

# Delete Teams Channel
$teamname = "<teamname>"
$channelname = "<channelname>"

$team = Get-Team `
            -DisplayName $teamname

Remove-TeamChannel `
    -GroupId $team.GroupId `
    -DisplayName $channelname


# Add Teams Channel User
$teamname = "<teamname>"
$channelname = "<channelname>"
$user = "<user>"

$team = Get-Team `
            -DisplayName $teamname

Add-TeamChannelUser `
    -GroupId $team.GroupId `
    -DisplayName $channelname `
    -User $user


# Remove Teams Channel User
$teamname = "<teamname>"
$channelname = "<channelname>"
$user = "<user>"

$team = Get-Team `
            -DisplayName $teamname

Remove-TeamChannelUser `
    -GroupId $team.GroupId `
    -DisplayName $channelname `
    -User $user
