# ================================================
# Script  : configure-dhcp.ps1
# Author  : Mohamed El Fehri
# Date    : July 2026
# Domain  : techstart.local
# Purpose : Create DHCP scope, set options,
#           add exclusion, authorize server in AD
# ================================================

# Create scope
Add-DhcpServerv4Scope `
  -Name "TS-LAN" `
  -StartRange 192.168.56.100 `
  -EndRange 192.168.56.200 `
  -SubnetMask 255.255.255.0 `
  -LeaseDuration 8:00:00 `
  -State Active

# Set scope options (router + DNS)
Set-DhcpServerv4OptionValue `
  -ScopeId 192.168.56.0 `
  -Router 192.168.56.1 `
  -DnsServer 192.168.56.10 `
  -DnsDomain "techstart.local"

# Exclude .100-.110 for static/reserved devices
Add-DhcpServerv4ExclusionRange `
  -ScopeId 192.168.56.0 `
  -StartRange 192.168.56.100 `
  -EndRange 192.168.56.110

# Authorize DHCP server in AD
Add-DhcpServerInDC `
  -DnsName "DC01.techstart.local" `
  -IPAddress 192.168.56.10

Restart-Service DHCPServer
Write-Host "DHCP configured and authorized" -ForegroundColor Green
