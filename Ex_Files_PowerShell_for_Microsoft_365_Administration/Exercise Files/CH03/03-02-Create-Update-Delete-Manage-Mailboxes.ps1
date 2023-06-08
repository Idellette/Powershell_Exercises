# Retrieve All Mailboxes
Get-ExoMailbox `
    -ResultSize Unlimited


# Retrieve Specific Mailbox
$user = "<user>"

Get-EXOMailbox `
    -Identity $user

# Retrieve All Shared Mailboxes
Get-ExoMailbox `
    –ResultSize Unlimited `
    –RecipientTypeDetails SharedMailbox


# Get Specific Mailbox Statistics
$user = "<user>"

Get-ExoMailboxStatistics `
    -Identity $user | `
        Select-Object DisplayName,TotalItemSize


# Get All Mailbox Statistics
Get-Mailbox `
    -ResultSize Unlimited | `
        Get-MailboxStatistics | `
            Select-Object DisplayName,TotalItemSize


# View Inactive Mailboxes
Get-Mailbox `
    -ResultSize Unlimited | `
        ForEach-Object {
            Get-MailboxStatistics -Identity $_.UserPrincipalName | Select-Object DisplayName,LastLogonTime,LastUserActionTime }


# Create a New Mailbox
$password = "<password>"
$user = "<user>"
$firstname = "<firstname>"
$lastname = "<lastname>"
$alias = "$($firstname)$($lastname.SubString(0,1))"


New-Mailbox `
    -Alias $alias `
    -Name $alias `
    -FirstName $firstname `
    -LastName $lastname `
    -DisplayName "$firstname $lastname" `
    -MicrosoftOnlineServicesID $user `
    -Password (ConvertTo-SecureString -String $password -AsPlainText -Force) `
    -ResetPasswordOnNextLogon $true

# View Specific Mailbox Permisisons
$user = "<user>"

Get-MailboxPermission `
    -Identity $user | `
        Format-List


# View All Mailbox Permisisons
Get-Mailbox `
    -ResultSize Unlimited | `
        Get-MailboxPermission


# Delete Specified Mailbox
$user = "<user>"

Remove-Mailbox `
    -Identity $user


# Restore Specified Mailbox
$user = "<user>"
$password = "<password>"

Undo-SoftDeletedMailbox $user `
    -WindowsLiveID $user `
    -Password (ConvertTo-SecureString -String $password -AsPlainText -Force)


# Delete Mail Items from Specific Mailbox
$subject = "<subject>"
$user = "<user>"

Get-Mailbox `
    -ResultSize unlimited | `
        Search-Mailbox `
            -SearchQuery subject:"$subject" `
                -DeleteContent
            






