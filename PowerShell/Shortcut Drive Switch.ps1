## INCOMPLETE/NOT WORKING
param (
    [Parameter(Mandatory=$true)][string]$sourcePath,
    [Parameter(Mandatory=$true)][string]$oldDriveLetter,
    [Parameter(Mandatory=$true)][string]$newDriveLetter
)

function GetShortcuts {
    $Shortcuts = Get-ChildItem -Recurse $sourcePath -Include *.lnk
    $Shell = New-Object -ComObject WScript.Shell

    foreach ($Shortcut in $Shortcuts) { ## Grab the target of the old shortcut
        $Properties = @{
            $Target = $Shell.CreateShortcut($Shortcut.FullName).TargetPath
        }
        $Target
	    New-Object PSObject -Property $Properties         
    }

    [Runtime.InteropServices.Marshal]::ReleaseComObject($Shell) | Out-Null
}


function SetShortcuts {
    $res = GetShortcuts
    $count = 0

    $shell = New-Object -ComObject WScript.Shell

    foreach($Target in $res) {
       if ($res.Target[$count].Substring(0, 2) -eq $oldDriveLetter) { 
       echo $res.Target[$count].ink
            $shortcut = $shell.CreateShortcut($res.Target[$count].ink)
            $shortcut.Save()
       }
       $count++
    }
}

SetShortcuts