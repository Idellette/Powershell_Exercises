# Retrieve All Teams
Get-Team


# Retrieve Specific Team
$team = "<team>"

Get-Team `
    -DisplayName $team


# Create New Team
$teamname = "<teamname>"
$teamdescription = "<teamdescription>"
$teamvisibility = "<teamvisibility>"

New-Team `
    -DisplayName $teamname

New-Team `
    -DisplayName $teamname `
    -Description $teamdescription `
    -Visibility $teamvisibility


# Update a Team
$teamname = "<teamname>"
$newteamname = "<newteamname>"
$imagepath = "<imagepath>"

$team = Get-Team -DisplayName $teamname 

Set-Team `
    -GroupId $team.GroupId `
    -DisplayName $newteamname

Set-TeamPicture `
    -GroupId $team.GroupId `
    -ImagePath $imagepath

Set-TeamFunSettings 
    -GroupId $team.GroupId `
    -AllowGiphy true `
    -GiphyContentRating Strict `
    -AllowStickersAndMemes true `
    -AllowCustomMemes true

Set-TeamMessagingSettings
    -GroupId $team.GroupId `
    -AllowUserEditMessages true `
    -AllowUserDeleteMessages true `
    -AllowOwnerDeleteMessages true `
    -AllowTeamMentions true `
    -AllowChannelMentions true

# Delete a Team
$teamname = "<teamname>"

$team = Get-Team -DisplayName $teamname 

Remove-Team
    -GroupId $team.GroupId

# Archive a Team and the Associated SharePoint Site Collection
$teamname = "<teamname>"

$team = Get-Team -DisplayName $teamname 

Set-TeamArchivedState `
    -GroupId $team.GroupId `
    -Archived:$true `
    -SetSpoSiteReadOnlyForMembers:$true