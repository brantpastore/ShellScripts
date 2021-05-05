# We can use this to get only the Node ID as a string.

$ztInfo = zerotier-cli info
$ztInfo = $ztInfo.Replace('200 ','');
$ztInfo = $ztInfo.Replace('info ','');
$ztInfo = $ztInfo.Replace(' 1.6.2 ','');
$ztInfo = $ztInfo.Replace('ONLINE','');

$NodeID = $ztInfo
Write-Host $NodeID;