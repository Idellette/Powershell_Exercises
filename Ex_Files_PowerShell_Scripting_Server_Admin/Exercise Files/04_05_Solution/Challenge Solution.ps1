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

Import-CafeUsers -OUName SupportStaff
Import-CafeUsers -OUName CafeManagers
Import-CafeUsers -OUName SalesMarketing
Import-CafeUsers -OUName RoomServiceStaff 
