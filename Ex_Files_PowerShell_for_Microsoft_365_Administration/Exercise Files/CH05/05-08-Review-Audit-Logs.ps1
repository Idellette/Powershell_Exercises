# Search the Administrator Audit Log and Send Results to Mailbox
$searchname = "<searchname>"
$statususer = "<statususer>"
$cmdlets = "<cmdlets>"
$startdate = "<startdate>"
$enddate = "<enddate>"
$parameters = "<parameters>"

New-AdminAuditLogSearch `
    -Name $searchname `
    -Cmdlets $cmdlets `
    -Parameters $parameters `
    -StartDate 0$startdate `
    -EndDate $enddate `
    -StatusMailRecipients $statususer


# Search Mailbox Audit Log and Send Results to Mailbox
$searchname = "<searchname>"
$mailboxes = "<mailboxes>"
$statususer = "<statususer>"
$cmdlets = "<cmdlets>"
$startdate = "<startdate>"
$enddate = "<enddate>"
$logontypes = "<logontypes>"

New-MailboxAuditLogSearch $searchname `
    -Mailboxes $mailboxes `
    -LogonTypes $logontypes `
    -StartDate $startdate `
    -EndDate $enddate `
    -StatusMailRecipients $statususer


# Search Admin Audit Log
$cmdlets = "<cmdlets>"

Search-AdminAuditLog `
    -Cmdlets $cmdlets

# Search Mailbox Audit Log
$mailbox = "<mailbox>"
$startdate = "<startdate>"
$enddate = "<enddate>"
$logontypes = "<logontypes>"
$resultsize = "<resultsize>"

Search-MailboxAuditLog `
    -Identity $mailbox `
    -LogonTypes $logontypes `
    -StartDate $startdate `
    -EndDate $enddate `
    -ResultSize $resultsize


# Search the Unified Audit Log
$mailbox = "<mailbox>"
$startdate = "<startdate>"
$enddate = "<enddate>"
$recordtype = "<recordtype>"
$operations = "<operations>"
$session = "<session>"
$sessioncommand = "<sessioncommand>"

Search-UnifiedAuditLog `
    -StartDate $startdate `
    -EndDate $enddate

Search-UnifiedAuditLog `
    -StartDate $startdate `
    -EndDate $enddate `
    -RecordType $recordtype

Search-UnifiedAuditLog `
    -StartDate $startdate `
    -EndDate $enddate `
    # https://docs.microsoft.com/en-us/office/office-365-management-api/office-365-management-activity-api-schema#auditlogrecordtype
    -RecordType $recordtype `
    # https://docs.microsoft.com/en-us/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance?view=o365-worldwide#audited-activities
    -Operations $operations `
    -SessionId $session `
    # ReturnLargeSet or ReturnNextPreviewPage
    -SessionCommand $sessioncommand


# Retrieve Azure Active Directory Logs
$filter = "<filter>"

Get-AzureADAuditDirectoryLogs `
    -Filter $filter


# Retrieve Azure Active Sign-in Logs
$filter = "<filter>"

Get-AzureADAuditSignInLogs `
    -Filter $filter


# Retrieve Azure Active Sign-in Logs
$filter = "<filter>"

Get-AzureADAuditSignInLogs `
    -Filter $filter