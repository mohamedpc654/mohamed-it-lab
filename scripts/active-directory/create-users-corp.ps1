# ================================================
# Script  : create-users-corp.ps1
# Author  : Mohamed El Fehri
# Date    : June 2026
# Domain  : corp.local
# Purpose : Create 5 department users with correct
#           OU placement and group membership
# ================================================

$users = @(
  @{Name="John Smith";  Sam="john.smith";  OU="IT";         Group="GRP-IT-Admins"},
  @{Name="Sarah Jones"; Sam="sarah.jones"; OU="HR";         Group="GRP-HR-Users"},
  @{Name="Mike Brown";  Sam="mike.brown";  OU="Finance";    Group="GRP-Finance-Users"},
  @{Name="Lisa White";  Sam="lisa.white";  OU="Sales";      Group="GRP-Sales-Users"},
  @{Name="Tom Green";   Sam="tom.green";   OU="Sales";      Group="GRP-Sales-Users"}
)

foreach ($u in $users) {
    New-ADUser `
      -Name $u.Name `
      -SamAccountName $u.Sam `
      -UserPrincipalName "$($u.Sam)@corp.local" `
      -Path "OU=$($u.OU),OU=Corp,DC=corp,DC=local" `
      -AccountPassword (ConvertTo-SecureString "P@ssw0rd2026!" -AsPlainText -Force) `
      -Enabled $true

    Add-ADGroupMember -Identity $u.Group -Members $u.Sam

    Write-Host "Created: $($u.Name) in $($u.OU) -> $($u.Group)" -ForegroundColor Green
}
