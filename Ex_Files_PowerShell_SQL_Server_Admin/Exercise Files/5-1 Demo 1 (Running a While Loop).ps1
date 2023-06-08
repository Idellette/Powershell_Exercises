[string] $SqlAuthLoginName = "sa" 
[string] $SqlAuthPassword = "Welcome12345" 

[string] $ConnectionString = "Server=localhost;Database=test3;User ID=$SqlAuthLoginName;Password=$SqlAuthPassword;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30;"

$Connection = New-Object System.Data.SqlClient.SqlConnection
$Connection.ConnectionString = $ConnectionString
$Connection.Open();


$Command = $Connection.CreateCommand()
$Command.CommandText = 
"
select *
from t1
where c1 = @a1
"

$a = $Command.Parameters.AddWithValue("a1", 1)

$reader = $Command.ExecuteReader()

while ($reader.Read())
{
    echo $reader.item("c2")
}

$Command.Dispose()
$Connection.Close()
