# update mailbox message configuration setting
# home brew # pwsh 
install-module exchangeonline management

connect-ExchangeOnline 

# set variable or user
$user="alias@userdomain.com"

# get the current settings
Get-Mailbox $user | Get-MailboxMessageConfiguration | select Identity,Signature*


#This is the default setting for signature text
#Set-MailboxMessageConfiguration -identity $user -autoaddsignature $true -SignatureText $true


# turn off the auto add signature setting and signature text
Set-MailboxMessageConfiguration -identity $user -autoaddsignature $false -SignatureText $false



#list the user message configuration
get-MailboxMessageConfiguration -identity $user |fl

