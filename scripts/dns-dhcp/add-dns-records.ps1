# ================================================
# Script  : add-dns-records.ps1
# Author  : Mohamed El Fehri
# Date    : July 2026
# Zone    : techstart.local
# Purpose : Create A records for key infrastructure
#           devices in the techstart.local DNS zone
# ================================================

Add-DnsServerResourceRecordA `
  -Name "fileserver" `
  -ZoneName "techstart.local" `
  -IPv4Address "192.168.56.30"

Add-DnsServerResourceRecordA `
  -Name "printer01" `
  -ZoneName "techstart.local" `
  -IPv4Address "192.168.56.40"

Add-DnsServerResourceRecordA `
  -Name "intranet" `
  -ZoneName "techstart.local" `
  -IPv4Address "192.168.56.50"

Write-Host "DNS A records created:" -ForegroundColor Green
Get-DnsServerResourceRecord -ZoneName "techstart.local" -RRType A
