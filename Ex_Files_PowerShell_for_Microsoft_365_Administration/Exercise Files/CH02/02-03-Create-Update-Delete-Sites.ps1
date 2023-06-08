# Retrieve all Subsites for Specified Site Collection
$url = "<url>"
$credential = Get-Credential

function Get-SPOSubsite($weburl, $credentials)
{
    $context = New-Object Microsoft.SharePoint.Client.ClientContext($weburl)
    $context.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($credentials.Username, $credentials.Password)

    $web = $context.Web
    $context.Load($web)
    $context.executeQuery()

    return $web
}

$web = Get-SPOSubsite `
    -weburl $url `
    -credentials $credential


# Create new Subsite in Specified Site Collection
$url = "<url>"
$subsiteurl = "<subsite>"
$credential = Get-Credential
$template = "<template>"
$title = "<title>"

function New-SPOSubsite($siteurl, $subsiteurl, $credentials)
{
    $context = New-Object Microsoft.SharePoint.Client.ClientContext($siteurl)
    $context.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($credentials.Username, $credentials.Password)

    $webclient = New-Object Microsoft.SharePoint.Client.WebCreationInformation
    $webclient.WebTemplate = $template

    $webclient.UseSamePermissionsAsParentSite = $true
    $webclient.Title = $title
    $webclient.Url = $subsiteurl
    $webclient.Language = "1033"

    $context.Web.Webs.Add($webclient)
    $context.ExecuteQuery()
}

New-SPOSubsite `
    -siteurl $url `
    -subsiteurl $subsiteurl `
    -credentials $credential


# Update Subsite by Url
$url = "<url>"
$credential = Get-Credential
$title = "<title>"
$description = "<description>"

function Update-SPOSubsite($weburl, $credentials, $title, $description)
{
    $context = New-Object Microsoft.SharePoint.Client.ClientContext($weburl)
    $context.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($credentials.Username, $credentials.Password)

    $web = $context.Web
    $context.Load($web)
    $context.executeQuery()

    $web.Title = $title
    $web.Description = $description
    
    $context.executeQuery()
}

Update-SPOSubsite `
    -weburl $url `
    -credentials $creds `
    -title $title `
    -description $description


# Remove Subsite by Url
$url = "<url>"
$credential = Get-Credential

function Remove-SPOSubsite($weburl, $credentials)
{
    $context = New-Object Microsoft.SharePoint.Client.ClientContext($weburl)   
    $context.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($credentials.Username, $credentials.Password)

    $web = $context.Web 

    $context.Load($web)
    $context.Load($web.Webs)
     
    $context.executeQuery()
    
    if ($web.Webs.Count -ne 0){
        foreach ($subweb in $web.Webs)
        {
            Remove-SPOSubsite($subweb.url)
        }
    }
    
    $web.DeleteObject()
    $Context.ExecuteQuery()
}

Remove-SPOSubsite `
    -weburl $url `
    -credentials $creds