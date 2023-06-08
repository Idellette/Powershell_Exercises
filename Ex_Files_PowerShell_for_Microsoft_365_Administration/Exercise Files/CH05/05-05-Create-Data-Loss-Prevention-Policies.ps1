# Retrieve All Data Loss Prevention Policies
Get-DlpCompliancePolicy


# Retrieve Specific Data Loss Prevention Policy
$dlpname = "<dlpname>"

Get-DlpCompliancePolicy `
    -Identity $dlpname | `
        Format-List


# Retrieve Data Loss Prevention Rules for Specified Policies
$dlpname = "<dlpname>"

$dlppolicy = Get-DlpCompliancePolicy `
                -Identity $dlpname

Get-DlpComplianceRule `
    -Policy $dlppolicy


# View Data Loss Prevention Detections Report
$startdate = "<startdate>"
$enddate = "<enddate>"

Get-DlpDetectionsReport `
    -StartDate $startdate `
    -EndDate $enddate


# View Data Loss Prevention Detections Report filtered to Specifc Policy
$dlpname = "<dlpname>"
$startdate = "<startdate>"
$enddate = "<enddate>"

$dlppolicy = Get-DlpCompliancePolicy `
                -Identity $dlpname

Get-DlpDetectionsReport `
    -StartDate $startdate `
    -EndDate $enddate
    -DlpCompliancePolicy $dlppolicy


# View Data Loss Prevention Detailed Report
$startdate = "<startdate>"
$enddate = "<enddate>"

Get-DlpDetailReport `
    -StartDate $startdate `
    -EndDate $enddate


# View All Sensitive Information Types
Get-DlpSensitiveInformationType


# Create New Sensitive Information Type from Document Template
$documenttemplatepath = "<$documenttemplatepath>"
$fingerprintdescription = "<fingerprintdescription>"
$siname = "<siname>"
$sidescription = "<sidescription>"

$template = Get-Content $documenttemplatepath `
                -Encoding byte `
                -ReadCount 0
$fingerprint = New-DlpFingerprint `
    -FileData $template `
    -Description $fingerprintdescription

New-DlpSensitiveInformationType `
    -Name $siname `
    -Fingerprints $fingerprint[0] `
    -Description $sidescription


# Create Keyword Dictionary
$keywordspath = "<keywordspath>"
$dictionaryname = "<dictionaryname>"
$dictionarydescription = "<dictionarydescription>"

$keywords = Get-Content $keywordspath
$encoded = $keywords | `
            ForEach-Object { [System.Text.Encoding]::Unicode.GetBytes($_+"`r`n") }

New-DlpKeywordDictionary `
    -Name $dictionaryname `
    -Description $dictionarydescription `
    -FileData $encoded


# Create Data Loss Prevention Policy using Sensitive Information Type
$policyname = "<policyname>"
$siname = "<siname>"

New-DlpPolicy `
    -Name $policyname `
    -Template $siname


# Create Data Loss Prevention Policy using Sensitive Information Type for Exchange
$policyname = "<policyname>"
$siname = "<siname>"

New-DlpPolicy `
    -Name $policyname `
    -Template $siname


# Create Data Loss Prevention Policy using Sensitive Information Type for Microsoft 365
$policyname = "<policyname>"
$policycomment = "<policycomment>"
$spo = "<spo>"
$onedrive = "<onedrive>"
$mode = "<mode>"
$siname = "<siname>"
$rulename = "<rulename>"

$policy = New-DlpCompliancePolicy `
    -Name $policyname `
    -Comment $policycomment  `
    -SharePointLocation $spo `
    -OneDriveLocation $onedrive `
    -Mode $mode

New-DlpComplianceRule `
    -Name $rulename `
    -Policy $policy `
    -ContentContainsSensitiveInformation @{ Name = "$siname" } `
    -BlockAccess $true


# Remove Data Loss Prevention Policy
$dlpname = "<dlpname>"

$policy = Get-DlpCompliancePolicy `
            -Identity $dlpname 

Remove-DlpCompliancePolicy `
    -Identity $policy


