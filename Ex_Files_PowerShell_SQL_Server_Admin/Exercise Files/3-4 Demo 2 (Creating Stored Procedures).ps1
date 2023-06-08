[string] $SqlAuthLoginName = "sa" 
[string] $SqlAuthPassword = "Welcome12345" 

[string] $ConnectionString = "Server=localhost;Database=test3;User ID=$SqlAuthLoginName;Password=$SqlAuthPassword;Encrypt=false;TrustServerCertificate=False;Connection Timeout=30;"

$Connection = New-Object System.Data.SqlClient.SqlConnection
$Connection.ConnectionString = $ConnectionString
$Connection.Open();


$Command = $Connection.CreateCommand()
$Command.CommandText = 
"
CREATE PROCEDURE p1 AS
SELECT c1 
FROM t1
"
    
$reader = $Command.ExecuteReader()
$reader.HasRows
$Command.Dispose()
$Connection.Close()
