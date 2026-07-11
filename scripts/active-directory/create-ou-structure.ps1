# ================================================
# Script  : create-ou-structure.ps1
# Author  : Mohamed El Fehri
# Date    : June 2026
# Domain  : corp.local
# Purpose : Create full OU structure under Corp
# ================================================

$departments = @("IT","HR","Finance","Sales","Management")

New-ADOrganizationalUnit -Name "Corp" -Path "DC=corp,DC=local"

foreach ($d in $departments) {
    New-ADOrganizationalUnit `
      -Name $d `
      -Path "OU=Corp,DC=corp,DC=local"
    Write-Host "Created OU: $d" -ForegroundColor Green
}
