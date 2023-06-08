# Return Default Advanced Threat Protection Policy Details
Get-AtpPolicyForO365

# Retrieve Specific Configuration Settings
$policy = Get-AtpPolicyForO365

$policy.EnableSafeLinksForClients
$policy.EnableSafeLinksForWebAccessCompanion
$policy.EnableSafeLinksForO365Clients
$policy.EnableATPForSPOTeamsODB
$policy.EnableSafeDocs
$policy.AllowSafeDocsOpen


# Retrieve Safe Attachment Policy
Get-SafeAttachmentPolicy | `
    Format-List


# Retrieve Safe Links Policy
Get-SafeLinksPolicy | `
    Format-Table Name, IsEnabled, IsDefault


# Create Safe Attachments Policy
$safeattachmentpolicyname = "<safeattachmentpolicyname>"
$safeattachmentrulename = "<safeattachmentrulename>"
$email = "<email>"
$sentto = "<sendto>"

$policy = New-SafeAttachmentPolicy `
    -Name $safeattachmentpolicyname `
    -Enable $true `
    -Redirect $true `
    -RedirectAddress $email

New-SafeAttachmentRule `
    -Name $safeattachmentrulename `
    -SafeAttachmentPolicy $policy `
    -SentToMemberOf $sentto


# Create Safe Links Policy
$safelinkpolicyname = "<safelinkpolicyname>"
$safelinkrulename = "<safelinkrulename>"
$email = "<email>"
$sentto = "<sendto>"

$policy = New-SafeLinksPolicy `
    -Name $safelinkpolicyname `
    -IsEnabled $true


New-SafeLinksRule `
    -Name $safelinkrulename`
    -SafeLinksPolicy $policy `
    -SentToMemberOf $sentto


# Update Default Advanced Threat Protection Policy
Set-AtpPolicyForO365 `
    -EnableSafeLinksForClients $true `
    -EnableATPForSPOTeamsODB $true `
    -EnableSafeDocs $true


# Update Safe Attachment Policy
$safeattachmentpolicyname = "<safeattachmentpolicyname>"
$email = "<email>"

$safeattachmentpolicy = Get-SafeAttachmentPolicy `
                            -Identity $safeattachmentpolicyname

Set-SafeAttachmentsPolicy `
    -Identity $safeattachmentpolicy `
    -Redirect $true `
    -Action DynamicDelivery `
    -RedirectAddress $email


# Update Safe Links Policy
$safelinkpolicyname = "<safelinkpolicyname>"

$safelinkspolicy = Get-SafeLinksPolicy `
                    -Identity $safelinkpolicyname

Set-SafeLinksPolicy `
    -Identity $safelinkspolicy `
    -DoNotAllowClickThrough $true `
    -DoNotTrackUserClicks $true `
    -EnableSafeLinksForTeams $true `
    -ScanUrls $true `
    -TrackClicks $true
