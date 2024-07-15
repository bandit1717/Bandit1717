# List huge mailboxes 


connect-exchangeonline

#user mailboxes
Get-EXOMailbox -ResultSize Unlimited | Get-EXOMailboxStatistics | Where-Object { $_.TotalItemSize.Value.ToBytes() -gt "50GB" } | Select-Object DisplayName, primarysmtpaddress, ItemCount, TotalItemSize | Sort-Object TotalItemSize -Descending


#shared mailboxes
Get-EXOMailbox -RecipientTypeDetails SharedMailbox -ResultSize Unlimited | Get-EXOMailboxStatistics | Where-Object { $_.TotalItemSize.Value.ToBytes() -gt "50GB" } | Select-Object DisplayName, primarysmtpaddress, ItemCount, TotalItemSize | Sort-Object TotalItemSize -Descending


