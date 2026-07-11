# ================================================
# Script  : create-users-techstart.ps1
# Author  : Mohamed El Fehri
# Date    : July 2026
# Domain  : techstart.local
# Purpose : Bulk create 20 users across 5 departments
#           with correct OU placement and group membership
# ================================================

$users = @(
  # IT (2)
  @{Name="Ali Ben Salem";    Sam="ali.bensalem";   OU="IT";         Group="GRP-TS-IT"},
  @{Name="Yassine Trabelsi"; Sam="yassine.trabelsi";OU="IT";         Group="GRP-TS-IT"},
  # HR (3)
  @{Name="Nour Mansour";     Sam="nour.mansour";   OU="HR";         Group="GRP-TS-HR"},
  @{Name="Sonia Gharbi";     Sam="sonia.gharbi";   OU="HR";         Group="GRP-TS-HR"},
  @{Name="Ines Khalil";      Sam="ines.khalil";    OU="HR";         Group="GRP-TS-HR"},
  # Finance (3)
  @{Name="Mehdi Bouaziz";    Sam="mehdi.bouaziz";  OU="Finance";    Group="GRP-TS-Finance"},
  @{Name="Rania Jebali";     Sam="rania.jebali";   OU="Finance";    Group="GRP-TS-Finance"},
  @{Name="Karim Ayari";      Sam="karim.ayari";    OU="Finance";    Group="GRP-TS-Finance"},
  # Sales (5)
  @{Name="Omar Ferchichi";   Sam="omar.ferchichi"; OU="Sales";      Group="GRP-TS-Sales"},
  @{Name="Fatma Riahi";      Sam="fatma.riahi";    OU="Sales";      Group="GRP-TS-Sales"},
  @{Name="Bilel Hamdi";      Sam="bilel.hamdi";    OU="Sales";      Group="GRP-TS-Sales"},
  @{Name="Cyrine Nasr";      Sam="cyrine.nasr";    OU="Sales";      Group="GRP-TS-Sales"},
  @{Name="Hedi Lassoued";    Sam="hedi.lassoued";  OU="Sales";      Group="GRP-TS-Sales"},
  # Management (2)
  @{Name="Zied Chaabane";    Sam="zied.chaabane";  OU="Management"; Group="GRP-TS-Management"},
  @{Name="Lena Dridi";       Sam="lena.dridi";     OU="Management"; Group="GRP-TS-Management"},
  # Remote (5)
  @{Name="Adem Boughattas";  Sam="adem.boughattas";OU="Remote";     Group="GRP-TS-Remote"},
  @{Name="Mariem Slama";     Sam="mariem.slama";   OU="Remote";     Group="GRP-TS-Remote"},
  @{Name="Tarek Mejri";      Sam="tarek.mejri";    OU="Remote";     Group="GRP-TS-Remote"},
  @{Name="Asma Hammami";     Sam="asma.hammami";   OU="Remote";     Group="GRP-TS-Remote"},
  @{Name="Fares Belhaj";     Sam="fares.belhaj";   OU="Remote";     Group="GRP-TS-Remote"}
)

foreach ($u in $users) {
    New-ADUser `
      -Name $u.Name `
      -SamAccountName $u.Sam `
      -UserPrincipalName "$($u.Sam)@techstart.local" `
      -Path "OU=$($u.OU),OU=Corp,DC=techstart,DC=local" `
      -AccountPassword (ConvertTo-SecureString "P@ssw0rd2026!" -AsPlainText -Force) `
      -Enabled $true

    Add-ADGroupMember -Identity $u.Group -Members $u.Sam

    Write-Host "Created: $($u.Name) -> $($u.OU) -> $($u.Group)" -ForegroundColor Green
}

Write-Host "`nAll 20 TechStart users created." -ForegroundColor Yellow
