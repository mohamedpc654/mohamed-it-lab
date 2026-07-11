# ================================================
# Script  : create-shares-corp.ps1
# Author  : Mohamed El Fehri
# Date    : June 2026
# Domain  : corp.local
# Purpose : Create SMB shares for each department
#           Share permission: group = Change
#           Everyone = No Access
# ================================================

$shares = @(
  @{Name="HR";      Group="GRP-HR-Users"},
  @{Name="Finance"; Group="GRP-Finance-Users"},
  @{Name="Sales";   Group="GRP-Sales-Users"},
  @{Name="IT_Tools";Group="GRP-IT-Admins"}
)

foreach ($s in $shares) {
    $folderPath = "C:\Shares\$($s.Name)_Data"
    $shareName  = "$($s.Name)_Share"

    New-Item -Path $folderPath -ItemType Directory -Force | Out-Null

    New-SmbShare `
      -Name $shareName `
      -Path $folderPath `
      -FullAccess "Administrators" `
      -ChangeAccess $s.Group `
      -NoAccess "Everyone" `
      -ErrorAction SilentlyContinue | Out-Null

    Write-Host "Shared: $shareName -> $folderPath" -ForegroundColor Green
}
