<#
.SYNOPSIS            
	Gets all of the ProgIDs registered on a system
.DESCRIPTION            
	Gets all ProgIDs registered on the system.  The ProgIDs returned can be used with New-Object -comObject
.EXAMPLE
	Get-ProgID
	
	Description
	-----------
	Reads all ProgIDs from the registry on the local system
.EXAMPLE
	Get-ProgID | Where-Object { $_.ProgID -like "*ado*" }
	
	Description
	-----------
	Reads all ProgIDs from the registry on the local system and filters on the name. Only ProgIDs for *ADO* are
	returned.
#>
param()            

$paths = @("REGISTRY::HKEY_CLASSES_ROOT\CLSID")
if ($env:Processor_Architecture -eq "amd64") {
    $paths+="REGISTRY::HKEY_CLASSES_ROOT\Wow6432Node\CLSID"
}

Get-ChildItem $paths -Include VersionIndependentPROGID -Recurse |
	Select-Object -Property `
		@{ Name = 'ProgID'; Expression = { $_.GetValue("") } },
		@{ Name = '32Bit'; Expression = { if ($env:Processor_Architecture -eq "amd64") {
			$_.PSPath.Contains("Wow6432Node")
        } else {
            $true
        }
    }
}