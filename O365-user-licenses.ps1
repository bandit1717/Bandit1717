#all user licenses
$user = "user@userdomain.com"

Import-Module Microsoft.Graph.Users

Connect-Graph -Scopes User.ReadWrite.All, Organization.Read.All



Get-mguserlicesedetail -userid $user

(Get-MgUserLicenseDetail -UserId $user -Property ServicePlans).ServicePlans

disconnect-graph