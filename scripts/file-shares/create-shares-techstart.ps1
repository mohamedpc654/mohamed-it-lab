# ================================================
# Script  : create-shares-techstart.ps1
# Author  : Mohamed El Fehri
# Date    : July 2026
# Domain  : techstart.local
# Purpose : Create SMB shares for each TechStart
#           department with correct group permissions
# ================================================

$shares = @(
  @{Name="HR";         Group="GRP-TS-HR"},
  @{Name="Finance";    Group="GRP-TS-Finance"},
  @{Name="Sales";      Group="GRP-TS-Sales"},
  @{Name="IT_Tools";   Group="GRP-TS-IT"},
  @{Name="Management"; Group="GRP-TS-Management"}
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

Write-Host "`nAll TechStart shares created." -ForegroundColor Yellow
Get-SmbShare | Where-Object { $_.Name -like "*_Share" } | Select Name, Path
