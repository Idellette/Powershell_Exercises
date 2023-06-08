$values = import-csv  -Path "C:\temp\process.csv"
$values | Select-Object -First 10 | Out-GridView