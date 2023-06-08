$folders = Get-ChildItem -Path "C:\"
$folders | foreach {
    [string] $Path = "C:\" + $_.Name
    
    Get-ChildItem -Path $Path
}