# ================================================
# Script  : set-ntfs-techstart.ps1
# Author  : Mohamed El Fehri
# Date    : July 2026
# Domain  : techstart.local
# Purpose : Set NTFS permissions on TechStart shares
#           Break inheritance, Admins=FullControl,
#           Department group=Modify
# ================================================

$domain = "techstart"

$shares = @(
  @{Path="C:\Shares\HR_Data";         Group="GRP-TS-HR"},
  @{Path="C:\Shares\Finance_Data";    Group="GRP-TS-Finance"},
  @{Path="C:\Shares\Sales_Data";      Group="GRP-TS-Sales"},
  @{Path="C:\Shares\IT_Tools_Data";   Group="GRP-TS-IT"},
  @{Path="C:\Shares\Management_Data"; Group="GRP-TS-Management"}
)

foreach ($s in $shares) {
    $acl = Get-Acl $s.Path
    $acl.SetAccessRuleProtection($true, $false)
    $acl.Access | ForEach-Object { $acl.RemoveAccessRule($_) } 2>$null

    $adminRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
      "BUILTIN\Administrators","FullControl","ContainerInherit,ObjectInherit","None","Allow"
    )
    $acl.AddAccessRule($adminRule)

    $groupRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
      "$domain\$($s.Group)","Modify","ContainerInherit,ObjectInherit","None","Allow"
    )
    $acl.AddAccessRule($groupRule)

    Set-Acl $s.Path $acl
    Write-Host "NTFS set: $($s.Path) -> $($s.Group) = Modify" -ForegroundColor Green
}

Write-Host "`nAll TechStart NTFS permissions configured." -ForegroundColor Yellow
