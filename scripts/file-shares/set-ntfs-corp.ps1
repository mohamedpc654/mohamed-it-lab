# ================================================
# Script  : set-ntfs-corp.ps1
# Author  : Mohamed El Fehri
# Date    : June 2026
# Domain  : corp.local
# Purpose : Set NTFS permissions on department shares
#           Breaks inheritance, removes defaults,
#           Admins = FullControl, Group = Modify
# ================================================

$domain = "corp"

$shares = @(
  @{Path="C:\Shares\HR_Data";      Group="GRP-HR-Users"},
  @{Path="C:\Shares\Finance_Data"; Group="GRP-Finance-Users"},
  @{Path="C:\Shares\Sales_Data";   Group="GRP-Sales-Users"},
  @{Path="C:\Shares\IT_Tools_Data";Group="GRP-IT-Admins"}
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
