# View Sensitivity Labels
Get-Label


# View Specific Sensitivity Label
$labelname = "<labelname>"

Get-Label `
    -Identity $labelname | `
            Format-List


# View Sensitivity Policies
Get-LabelPolicy


# View Specific Sensitivity Policy
$policyname = "<labelname>"

Get-LabelPolicy `
    -Identity $policyname | `
            Format-List


# Create Sensivitity Label
$labelname = "<labelname>"
$labeldescription = "<labeldescription>"

New-Label `
    -Name $labelname `
    -DisplayName $labeldescription

$labelname = "<labelname>"
$labeldescription = "<labeldescription>"
$text = "<text>"
$fontsize = "<fontsize>"
$fontcolor = "<fontcolor>"
$fontname = "<fontname>"
$layout = "<layout>"

New-Label `
    -Name $labelname `
    -DisplayName $labelname `
    -Comment $labeldescription `
    -ApplyWaterMarkingEnabled $true `
    -ApplyWaterMarkingFontColor $fontcolor `
    -ApplyWaterMarkingFontName $fontname `
    -ApplyWaterMarkingFontSize $fontsize `
    -ApplyWaterMarkingLayout $layout `
    -ApplyWaterMarkingText $text



# Create Sensivitity Label then Update
$labelname = "<labelname>"
$labeldescription = "<labeldescription>"
$text = "<text>"
$fontsize = "<fontsize>"
$fontcolor = "<fontcolor>"
$fontname = "<fontname>"
$layout = "<layout>"
$tooltip = "<tooltip>"

$label = New-Label `
            -DisplayName $labelname `
            -Name $labelname `
            -Comment $labeldescription `
            -Tooltip $tooltip

Set-Label `
    -Identity $label `
    -LabelActions '{"Type":"applycontentmarking","SubType":"header","Settings":[
            {"Key":"fontsize","Value":"10"},
            {"Key":"placement","Value":"Header"},
            {"Key":"text","Value":"Header"},
            {"Key":"fontcolor","Value":"#000000"}
        ]}'

Set-Label `
    -Identity $label `
    -LabelActions '{"Type":"applycontentmarking","SubType":"footer","Settings":[
            {"Key":"fontsize","Value":"10"},
            {"Key":"placement","Value":"Footer"},
            {"Key":"text","Value":"Footer"},
            {"Key":"fontcolor","Value":"#000000"}
        ]}'

Set-Label `
    -Identity $label `
    -LabelActions '{"Type":"applywatermarking","SubType":null,"Settings":[
            {"Key":"fontsize","Value":"10"},
            {"Key":"layout","Value":"Diagonal"},
            {"Key":"fontcolor","Value":"#000000"},
            {"Key":"disabled","Value":"false"},
            {"Key":"text","Value":"Watermark"}
        ]}'


# Create Sensitivity Policy
$labelname = "<labelname>"
$labelpolicyname = "<labelpolicyname>"

$label = Get-Label `
            -Identity $labelname

New-LabelPolicy `
    -Name $labelpolicyname `
    -Labels $label


# Create Sensitivity Policy and Disable Bar in Outlook
$labelname = "<labelname>"
$labelpolicyname = "<labelpolicyname>"

$label = Get-Label `
            -Identity $labelname

New-LabelPolicy `
    -Name $labelpolicyname `
    -Labels $label `
    -AdvancedSettings @{ OutlookDefaultLabel = "None" }


# Update Sensitivity Policy
$policyname = "<labelname>"

$policy = Get-LabelPolicy `
        -Identity $policyname 

Set-LabelPolicy `
    -Identity $policy `
    -AddExchangeLocation "All" `
    -AddModernGroupLocation "All" `
    -AddOneDriveLocation "All" `
    -AddPublicFolderLocation "All" `
    -AddSharePointLocation "All" `
    -AddSkypeLocation "All" `
    -AdvancedSettings @{ AttachmentAction = "Automatic" }


