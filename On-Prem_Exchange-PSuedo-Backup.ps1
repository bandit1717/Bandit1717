
# Basically what this does is fake a VSS backup on the volume that the Exchange database is on, which ends up causing Exchange to truncate the logs.
# This will break any backup softwares incremental backup chain so the next real backup will have to be a full backup.

Write-host "Psuedo Backup"

cmd

diskshadow

add volume c:
add volume f:
add volume g:
add volume h:
add volume i:
add volume j:
add volume k:
add volume l:
add volume m:
add volume n:
add volume o:
add volume p:
add volume q:
add volume r:
add volume s:
add volume t:
add volume u:
add volume v:


begin backup

create

end backup

exit

powershell

write-host "complete"
