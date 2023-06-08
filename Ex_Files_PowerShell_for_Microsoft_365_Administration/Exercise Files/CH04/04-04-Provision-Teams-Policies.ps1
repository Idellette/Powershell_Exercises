# View Meeting Policies
Get-CsTeamsMeetingPolicy

$meetingpolicyname = "<meetingpolicyname>"
Get-CsTeamsMeetingPolicy `
    -Identity $meetingpolicyname

Get-CsTeamsMeetingPolicy | `
    Where-Object { $_.AllowMeetNow -eq $true }

# View Messaging Policies
Get-CsTeamsMessagingPolicy

$messagingpolicyname = "<messagingpolicyname>"
Get-CsTeamsMessagingPolicy `
    -Identity $messagingpolicyname

# View Teams App Setup Policies
Get-CsTeamsAppSetupPolicy

$appsetuppolicyname = "<appsetuppolicyname>"
Get-CsTeamsAppSetupPolicy `
    -Identity $appsetuppolicyname

# View New-CsTeamsCalling Policies
Get-CsTeamsCallingPolicy

$callingpolicyname = "<callingpolicyname>"
Get-CsTeamsCallingPolicy `
    -Identity $callingpolicyname

# View Teams Broadcast Policies
Get-CsTeamsMeetingBroadcastPolicy

$broadcastpolicyname = "<broadcastpolicyname>"
Get-CsTeamsMeetingBroadcastPolicy `
    -Identity $broadcastpolicyname

# View Teams Channel Policies
Get-CsTeamsChannelsPolicy

$channelpolicyname = "<channelpolicyname>"
Get-CsTeamsChannelsPolicy `
    -Identity $channelpolicyname

# Create Callling Policy
$callingpolicyname = "<callingpolicyname>"

New-CsTeamsCallingPolicy `
    -Identity "Calling Policy" `
    -AllowPrivateCalling $true `
    -AllowCallForwardingToUser $false `
    -AllowCallForwardingToPhone $false `
    -AllowVoicemail "AlwaysDisabled" `
    -AllowCallGroups $false `
    -AllowDelegation $false `
    -PreventTollBypass $false `
    -BusyOnBusyEnabledType "Disabled" `
    -AllowWebPSTNCalling $true

# Create Messaging Policy
$messagingpolicyname = "<messagingpolicyname>"

New-CsTeamsMessagingPolicy `
    -Identity $messagingpolicyname `
    -AllowUrlPreviews $true `
    -AllowOwnerDeleteMessage $false `
    -AllowUserEditMessage $true `
    -AllowUserDeleteMessage $false `
    -AllowUserChat $false `
    -AllowGiphy $false `
    -GiphyRatingType STRICT `
    -AllowMemes $false `
    -AllowStickers $true `
    -AllowUserTranslation $true `
    -AllowImmersiveReader $true `
    -AllowRemoveUser $false `
    -AllowPriorityMessages $false `
    -AllowSmartReply $false `
    -ReadReceiptsEnabledType Everyone `
    -AudioMessageEnabledType Disabled `
    -ChannelsInChatListEnabledType DisabledUserOverride


# Update Messaging Policy
$messagingpolicyname = "<messagingpolicyname>"

Set-CsTeamsMessagingPolicy `
    -Identity $messagingpolicyname `
    -AllowGiphy $true `
    -AllowMemes $true `
    -AllowStickers $false

# Remove Messaging Policy
$messagingpolicyname = "<messagingpolicyname>"

Remove-CsTeamsMessagingPolicy `
    -Identity $messagingpolicyname
