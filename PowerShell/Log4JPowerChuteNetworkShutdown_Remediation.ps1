# Download 7zip:
$url = "https://www.7-zip.org/a/7z2107-x64.msi";
$output = $env:TEMP + "7z2107-x64.msi";
Invoke-WebRequest -Uri $url -OutFile $output
msiexec /i $output /qb;
Remove-Item $output;

$7zipPath = "C:\Program Files\7-Zip"
cd $7zipPath

net stop pcns1
.\7z.exe d "C:\Program Files\APC\PowerChute\group1\lib\log4j-core-2.1.13.3.jar" JndiLookup.class -r
net start pcns1

'"$($7zipPath)\Uninstall.exe"' | cmd