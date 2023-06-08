# View Actvity Alerts
Get-ActivityAlert


# View Specific Alert
$alertname = "<alertname>"

Get-ActivityAlert `
    -Identity $alertname


# View Protection Alerts
Get-ProtectionAlert


# View Specific Protection Alert
$alertname = "<alertname>"

Get-ProtectionAlert `
    -Identity $alertname


# Create Activity Alert
$alertname = "<alertname>"
$operation = "<operation>"
$notifyuser = "<notifyuser>"
$userid = "<userid>"
$description = "<description>"

New-ActivityAlert `
    -Name $alertname `
    -Operation $operation `
    -NotifyUser $notifyuser `
    -UserId $userid `
    -Description $description

    
# Create Protection Alert
$alertname = "<alertname>"
$operation = "<operation>"
$notifyuser = "<notifyuser>"
$threattype = "<threattype>"
$description = "<description>"
$aggregationtype = "<aggregationtype>"

New-ProtectionAlert `
    -Name $alertname `
    -Category Others `
    -NotifyUser $notifyuser `
    -ThreatType $threattype `
    -Operation $operation `
    -Description $description `
    -AggregationType $aggregationtype


# Update Activity Alert
$alertname = "<alertname>"
$operation = "<operation>"
$notifyuser = "<notifyuser>"

$alert = Get-ActivityAlert $alertname
$alert.NotifyUser.Add($notifyuser)

Set-ActivityAlert $alertname `
    -NotifyUser $alert.NotifyUser

Set-ActivityAlert $alertname `
    -Disabled $true


# Update Protection Alert
$alertname = "<alertname>"
$aggregationtype = "<aggregationtype>"
$threshold = "<threshold>"
$timewindow = "<timewindow>"

$alert = Get-ProtectionAlert `
            -Identity $alertname

Set-ProtectionAlert `
    -Identity $alert `
    -NotifyUserOnFilterMatch:$true `
    -AggregationType SimpleAggregation `
    -Threshold $threshold `
    -TimeWindow $timewindow


# Create Activity Alert using Parameters
$alertname = "<alertname>"
$operation = "<operation>"
$notifyuser = "<notifyuser>"
$userid = "<userid>"
$description = "<description>"
$aggregationtype = "<aggregationtype>"


$policy = @{
    "Name" = $alertname;
    "operation" = $operation;
    "notifyuser" = $notifyusers;
    "userid" = $userids;
    "Description" = $description;
}
    
$alert = New-ActivityAlert $policy