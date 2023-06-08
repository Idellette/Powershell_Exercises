# Retrieve All Teams Users
Get-CsOnlineUser

Get-CsOnlineUser | `
    Select-Object Alias,UserPrincipalName | `
        Format-Table

# Retrieve Specific User
$userprincipalname = "<userprincipalname>"

Get-CsOnlineUser `
    -Identity $userprincipalname | `
        Select-Object Alias,UserPrincipalName | `
            Format-Table


# Retrieve Users Assigned to Specified Meeting Policy
$meetingpolicy = "<meetingpolicy>"

$filter = 'TeamsMeetingPolicy -eq "{0}"' `
                -f $meetingpolicy

Get-CsOnlineUser `
    -Filter $filter


# Retrieve Teams Tenant
Get-CsTenant


# View Teams Tenant Specific Properties
$tenant = Get-CsTenant

$tenant.DisplayName
$tenant.Domains
$tenant.TeamsUpgradeEffectiveMode
$tenant.TeamsUpgradeOverridePolicy


# Upgrade Skype for Business User to Teams
$user = "<user>"
$policy = "<policy>"

Grant-CsTeamsUpgradePolicy `
    -PolicyName $policy `
    -Identity $user


# Upgrade entire Tenant from Skype for Business to Teams
$policy = "<policy>"

Grant-CsTeamsUpgradePolicy `
    -PolicyName $policy `
    -Global


# Retrieve Tenant Federation Configuration
Get-CsTenantFederationConfiguration


# Retrieve Tenant Federation Configuration Properties
$tenant = Get-CsTenantFederationConfiguration

$tenant.AllowedDomains
$tenant.BlockedDomains
$tenant.AllowFederatedUsers
$tenant.AllowPublicUsers


# Block Communication to Federated Domain
$domainpattern = "<domain>"

$domain = New-CsEdgeDomainPattern `
        -Domain $domainpattern

Set-CsTenantFederationConfiguration `
    -BlockedDomains @{ Replace = $domain }


# Retrieve Teams Client Configuration
Get-CsTeamsClientConfiguration


# Retrieve Teams Client Configuration Properties
$configuration = Get-CsTeamsClientConfiguration

$configuration.AllowEmailIntoChannel
$configuration.AllowDropBox
$configuration.AllowBox
$configuration.AllowGoogleDrive
$configuration.AllowShareFile
$configuration.AllowEgnyte
$configuration.AllowOrganizationTab
$configuration.AllowSkypeBusinessInterop 
$configuration.AllowGuestUser
$configuration.AllowRoleBasedChatPermissions

# Update Teams Client Configuration Properties
Set-CsTeamsClientConfiguration `
    -AllowGuestUser $true `
    -AllowGoogleDrive $true `
    -Identity Global


# Create Policy Package
$policypackagename = "<policypackagename>"
$policylist = "<policylist>"

New-CsCustomPolicyPackage `
    -Identity $policypackagename `
    -PolicyList $policylist

# Assign the Policy Package
$policypackagename = "<policypackagename>"
$search = "<search>"

$group = Get-AzureADGroup `
    -SearchString $search

Grant-CsGroupPolicyPackageAssignment `
    -GroupId $group `
    -PackageName $policypackagename






