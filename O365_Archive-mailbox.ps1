#Enable mailbox archive exchange online
# home brew # pwsh 
Connect-ExchangeOnline

# Update-Module ExchangeOnlineManagement


$user= "My_user@user.com"


# Change the following setting to your specific archive policy 

$policy= "1_Year_Move_To_Archive"


# Set-mailbox retention policy
Set-Mailbox -RetentionPolicy $policy -identity $user


# enable mailbox archive 
Enable-Mailbox -Identity $user -Archive


Enable-Mailbox -Identity $user -AutoExpandingArchive


# start the mailbox managed folder assistant to start the archive process based on your policy

Start-ManagedFolderAssistant -Identity $user
start-sleep -seconds 10
Start-ManagedFolderAssistant -Identity $user -HoldCleanup
start-sleep -seconds 10
Start-ManagedFolderAssistant -Identity $user -AggMailboxCleanup
start-sleep -seconds 10
Start-ManagedFolderAssistant -Identity $user -FullCrawl
start-sleep -seconds 10
Start-ManagedFolderAssistant -Identity $user


get-mailboxstatistics $user -archive |select displayname, isarchivemailbox,TotalItemSize


get-mailbox -resultsize unlimited -Archive |select displayname,primarysmtpaddress,autoexpandingarchiveenabled,archive

get-mailbox -resultsize unlimited |?{$_.autoexpandingarchiveenabled -eq "true"} |select displayname,samaccountname, primarysmtpaddress,database

