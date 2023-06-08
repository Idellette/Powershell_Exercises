[string] $SqlAuthLoginName = "sa" 
[string] $SqlAuthPassword = "Welcome12345" 

[string] $ConnectionString = "Server=localhost;Database=test3;User ID=$SqlAuthLoginName;Password=$SqlAuthPassword;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30;"

$Connection = New-Object System.Data.SqlClient.SqlConnection
$Connection.ConnectionString = $ConnectionString
$Connection.Open();


$Command = $Connection.CreateCommand()
$Command.CommandType = [System.Data.CommandType]::StoredProcedure
$Command.CommandText = "p1"

$a = $Command.Parameters.AddWithValue("a1", 1)

$reader = $Command.ExecuteReader()

while ($reader.Read())
{
    echo $reader.item("c1")
}

$Command.Dispose()
$Connection.Close()
