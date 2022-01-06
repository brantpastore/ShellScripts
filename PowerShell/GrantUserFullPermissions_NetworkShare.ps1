Add-NTFSAccess -Path C:\path\here `
    -Account '', '' `
    -AccessRights FullControl

$Share = ""
$acl = Get-Acl $Share
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("","FullControl","Allow")

$acl.SetAccessRule($AccessRule)

$acl | Set-Acl $Share