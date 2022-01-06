# Grab the users SID
$name = ''

$user_sid = (New-Object System.Security.Principal.NTAccount($name)).Translate([System.Security.Principal.SecurityIdentifier]).value

# Do some registry magic here.
# We want to find the users FSLogix Profile
# Computer\LOCAL_MACHINE\SOFTWARE\FSLogix\Profiles\Sessions + SID


# Grab the VHD File path and ensure it exists:

# Grab the path from the registry key 
# On the share - the former desktop will be located in 
# \\share\path
