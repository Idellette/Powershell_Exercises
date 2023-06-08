[string] $SqlAuthLoginName = "sa" #$SqlAuthCredential.GetNetworkCredential().UserName
[string] $SqlAuthPassword = "Welcome12345" #$SqlAuthCredential.GetNetworkCredential().Password

[string] $ConnectionString = "Server=localhost;Database=master;User ID=$SqlAuthLoginName;Password=$SqlAuthPassword;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30;"

$Connection = New-Object System.Data.SqlClient.SqlConnection
$Connection.ConnectionString = $ConnectionString
$Connection.Open();


$Command = $Connection.CreateCommand()
$Command.CommandText = 
"
select @@SERVERNAME s1
"

$reader = $Command.ExecuteReader()

while ($reader.Read())
{
    echo $reader.item("s1")
}

$Command.Dispose()
$Connection.Close()
