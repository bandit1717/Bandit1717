Connect-ExchangeOnline 

$user = user@userdomain.com
$user2 = $user+':\calendar'

Get-exomailboxFolderpermission -Identity $user2 |ft
 
# allow user to edit all items in calendar
set-mailboxFolderpermission -Identity $user2 -User neeedingaccess@userdomain.com -AccessRights publishingeditor


Disconnect-ExchangeOnline -Confirm:$false