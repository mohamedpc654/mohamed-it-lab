# ================================================
# Script  : create-groups-corp.ps1
# Author  : Mohamed El Fehri
# Date    : June 2026
# Domain  : corp.local
# Purpose : Create security groups per department
# ================================================

$groups = @(
  @{Name="GRP-IT-Admins";      OU="IT"},
  @{Name="GRP-HR-Users";       OU="HR"},
  @{Name="GRP-Finance-Users";  OU="Finance"},
  @{Name="GRP-Sales-Users";    OU="Sales"},
  @{Name="GRP-Management-Users"; OU="Management"}
)

foreach ($g in $groups) {
    New-ADGroup `
      -Name $g.Name `
      -GroupScope Global `
      -GroupCategory Security `
      -Path "OU=$($g.OU),OU=Corp,DC=corp,DC=local"
    Write-Host "Created group: $($g.Name)" -ForegroundColor Green
}
