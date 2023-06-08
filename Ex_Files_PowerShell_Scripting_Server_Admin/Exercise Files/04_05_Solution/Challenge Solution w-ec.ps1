Function Import-CafeUsers
    {
    Param (
        [string] $OUName
        )

    $ExportName = "C:\DataFiles\"+$OUName+".csv"
    $Location = "OU="+$OUName+",DC=landonhotel,DC=com"

    New-ADOrganizationalUnit -Name $OUName -Path "DC=landonhotel,DC=com" -ProtectedFromAccidentalDeletion $False

    $LCPassword = "Action1!" | ConvertTo-SecureString -AsPlainText -Force

    Import-CSV $ExportName    |
    New-ADUser -Path $Location -AccountPassword $LCPassword -Enabled $TRUE

    }

$CheckFolder = Test-Path C:\DataFiles\*.csv
If ( $CheckFolder -eq $True )
    {

    Set-Location C:\DataFiles
    Set-Content .\Files.txt (Get-ChildItem).Name

    (Get-Content .\Files.txt ).Replace('.csv','') | Out-File .\Process.txt
   
    ForEach ($OrgUnit in Get-Content C:\DataFiles\Process.txt)
        {
        Import-CafeUsers -OUName $OrgUnit
        }

    }
    Else { Write-Host "Create a directory named DataFiles in the root of C and place in it the CSV exports. The attempt this script again" }