$values = Import-Clixml  -Path "C:\temp\process.xml"
$values | Select-Object -First 10 | Out-GridView