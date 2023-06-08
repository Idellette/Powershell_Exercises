# View Teams Templates
Get-CsTeamTemplateList

# Retrieve Specific Teams Template
$odataid = "<odataid>"

Get-CsTeamTemplate `
    -OdataId $odataid


# Retrieve Teams Templates using Filter
$filter = "<filter>"

Get-CsTeamTemplateList -PublicTemplateLocale en-US | `
    Where-Object Name -like $filter | `
        ForEach-Object { Get-CsTeamTemplate `
                                -OdataId $_.OdataId }


# Create a Teams Template from Existing Template
$jsonlocation = "<jsonlocation>"
$odataid = "<odataid>"

Get-CsTeamTemplate `
    -OdataId $odataid | `
        ConvertTo-Json | `
            Out-File $jsonlocation

New-CsTeamTemplate `
    -Locale en-US `
        -Body (Get-Content $jsonlocation | Out-String)


# Create New Teams Template from Scratch
$templatename = "<templatename>"
$templateshortdescription = "<templateshortdescription>"
$templatedescription = "<templatedescription>"
$appid = "<appid>"
$primarychanneldisplay = "<primarychanneldisplay>"
$primarychannelid = "<primarychannelid>"
$secondarychanneldisplay = "<secondarychanneldisplay>"
$secondarychannelid = "<secondarychannelid>"
$locale = "<locale>"

$template = New-Object Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Models.TeamTemplate `
    -Property @{`
        DisplayName = $templatename; `
        ShortDescription = $templateshortdescription; `
        Description = $templatedescription; `
        App = @{ id = $appid  }; `
        Channel = @{ `
            displayName = $primarychanneldisplay;`
            id = $primarychannelid;`
            isFavoriteByDefault = $true`
            },`
            @{`
                displayName = $secondarychanneldisplay;`
                id = $secondarychannelid;`
                isFavoriteByDefault = $false`
            }`
    }

New-CsTeamTemplate `
    -Locale $locale `
    -Body $template


# Update a Teams Template from Updated JSON
$jsonlocation = "<jsonlocation>"
$odataid = "<odataid>"

Get-CsTeamTemplate `
    -OdataId $odataid | `
        ConvertTo-Json | `
            Out-File $jsonlocation

Update-CsTeamTemplate `
    -OdataId $odataid `
    -Body (Get-Content $jsonlocation | Out-String)


# Update a Teams Template using Object
$templatename = "<templatename>"
$templateshortdescription = "<templateshortdescription>"
$templatedescription = "<templatedescription>"
$appid = "<appid>"
$primarychanneldisplay = "<primarychanneldisplay>"
$primarychannelid = "<primarychannelid>"
$secondarychanneldisplay = "<secondarychanneldisplay>"
$secondarychannelid = "<secondarychannelid>"
$odataid = "<odataid>"

$template = New-Object Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Models.TeamTemplate `
    -Property @{`
        DisplayName = $templatename; `
        ShortDescription = $templateshortdescription; `
        Description = $templatedescription; `
        App = @{ id = $appid  }; `
        Channel = @{ `
            displayName = $primarychanneldisplay;`
            id = $primarychannelid;`
            isFavoriteByDefault = $true`
            },`
            @{`
                displayName = $secondarychanneldisplay;`
                id = $secondarychannelid;`
                isFavoriteByDefault = $false`
            }`
    }

Update-CsTeamTemplate `
    -OdataId $odataid `
    -Body $template


# Delete a Teams Template
$odataid = "<odataid>"
$filter = "<filter>"

Remove-CsTeamTemplate `
    -OdataId $odataid

Get-CsTeamTemplateList -PublicTemplateLocale en-US | `
    Where-Object Name -like $filter | `
        ForEach-Object { Remove-CsTeamTemplate `
                                -OdataId $_.OdataId }




