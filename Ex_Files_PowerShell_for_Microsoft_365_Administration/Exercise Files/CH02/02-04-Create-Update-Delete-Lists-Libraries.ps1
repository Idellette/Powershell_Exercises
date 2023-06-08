# Retrieve All Lists and Libraries within Specificed Site Collection
$url = "<url>"
$credential = Get-Credential

function Get-SPOList($weburl, $credentials)
{
    $context = New-Object Microsoft.SharePoint.Client.ClientContext($weburl)
    $context.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($credentials.Username, $credentials.Password)

    $web = $context.Web
    $lists = $web.Lists

    $context.Load($lists)
    $context.Load($web)
    $context.executeQuery()

    return $lists
}


$lists = Get-SPOLists `
    -weburl $url `
    -credentials $credential

$lists | Select-Object Title


# Create new List or Library in Specified Site Collection
$url = "<url>"
$listname = "<listname>"
$listdescription = "<listdescription>"
$listtemplate = "<listtemplate>"
$credential = Get-Credential

function New-SPOList($weburl, $name, $description, $template, $credentials)
{
    $context = New-Object Microsoft.SharePoint.Client.ClientContext($weburl)
    $context.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($credentials.Username, $credentials.Password)

    $list = New-Object Microsoft.SharePoint.Client.ListCreationInformation
    $list.Title = $listname
    $list.TemplateType = $template

    $list = $context.Web.Lists.Add($list)
    $list.Description = $listdescription

    $list.Update()
    $context.ExecuteQuery()
}

New-SPOList `
    -siteurl $url `
    -name $listname `
    -description $listdescription `
    -template $listtemplate `
    -credentials $credential


# Remove a List or Library in Specified Site Collection
$url = "<url>"
$listname = "<listname>"
$credential = Get-Credential

function Remove-SPOList($weburl, $name, $credentials)
{
    $context = New-Object Microsoft.SharePoint.Client.ClientContext($weburl)
    $context.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($credentials.Username, $credentials.Password)

    $list = New-Object Microsoft.SharePoint.Client.ListCreationInformation
    $list = $context.Web.Lists.GetByTitle($name)
    $list.AllowDeletion = $true

    $list.DeleteObject()
    $context.ExecuteQuery()
}

Remove-SPOList `
    -weburl $url `
    -name $listname `
    -credentials $credential



# Retrieve All Lists Items within Specified List
$url = "<url>"
$listname = "<listname>"
$credential = Get-Credential

function Get-SPOListItem($weburl, $name, $credentials)
{
    $context = New-Object Microsoft.SharePoint.Client.ClientContext($weburl)
    $context.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($credentials.Username, $credentials.Password)

    $web = $context.Web
    $list = $web.Lists.GetByTitle($name)
    $listitems = $List.GetItems([Microsoft.SharePoint.Client.CamlQuery]::CreateAllItemsQuery()) 

    $context.Load($listitems)
    $context.executeQuery()

    return $listitems
}

Get-SPOListItem `
    -weburl $url `
    -name $listname `
    -credentials $credential


# Delete All List Items within Specified List
$url = "<url>"
$listname = "<listname>"
$credential = Get-Credential

function Remove-SPOListItem($weburl, $name, $credentials)
{
    $context = New-Object Microsoft.SharePoint.Client.ClientContext($weburl)
    $context.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($credentials.Username, $credentials.Password)

    $web = $context.Web
    $list = $web.Lists.GetByTitle($name)
    $listitems = $List.GetItems([Microsoft.SharePoint.Client.CamlQuery]::CreateAllItemsQuery()) 

    $context.Load($listitems)
    $context.executeQuery()

    $listitems | ForEach-Object { $list.GetItemById($_.Id).DeleteObject() }

    $context.executeQuery()
}


# Set List Permission for User on a Specified List
$url = "<url>"
$listname = "<listname>"
$permissionlevel = "<permissionlevel>"
$username = "<groupname>"
$credential = Get-Credential

function Set-SPOListPermission($weburl, $listname, $username, $permission, $credentials)
{
    $context = New-Object Microsoft.SharePoint.Client.ClientContext($weburl)
    $context.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($credentials.Username, $credentials.Password)

    $web = $context.Web
    $list = $web.Lists.GetByTitle($listname)

    $list.BreakRoleInheritance($true,$true)
    $context.ExecuteQuery()

    $user = $web.EnsureUser($username)
    $context.load($user)
    
    $context.ExecuteQuery()

    $role = $web.RoleDefinitions.GetByName($permission)
    $roledefinition = New-Object Microsoft.SharePoint.Client.RoleDefinitionBindingCollection($context)
    $roledefinition.Add($role)

    $List.RoleAssignments.Add($user, $roledefinition)
    $list.Update()
    $context.ExecuteQuery()
}


Set-SPOListPermission `
    -weburl $url `
    -listname $listname `
    -username $username `
    -permission $permissionlevel `
    -credentials $credential


# Add Columns to a Specified List
$url = "<url>"
$listname = "<listname>"
$credential = Get-Credential
$columns = @()

$columns += "Author"
$columns += "Keywords"
$columns += "Status"

function Add-SPOListColumns($weburl, $listname, $sitecolumns, $credentials)
{
    $context = New-Object Microsoft.SharePoint.Client.ClientContext($weburl)
    $context.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($credentials.Username, $credentials.Password)

    $web = $context.Web
    $list = $web.Lists.GetByTitle($listname)

    foreach($column in $columns)
    {
        $field = $Web.Fields.GetByTitle($column)
        $list.Fields.Add($field)
        $context.ExecuteQuery()
    }
}


Add-SPOListColumns `
    -weburl $url `
    -listname $listname `
    -sitecolumns @columns `
    -credentials $credential


