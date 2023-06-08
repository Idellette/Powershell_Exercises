If ( -Not (Test-Path -Path C:\ScriptOutput) )
    {
        New-Item -Path C:\ -Name ScriptOutput -ItemType "directory"

        Set-Content -Path c:\ScriptOutput\Created.txt -Value "This directory was created"

        Get-Date -Format MM/dd/yyyy-hh:mm |
        Add-Content -NoNewLine -Path C:\ScriptOutput\Created.txt
    }