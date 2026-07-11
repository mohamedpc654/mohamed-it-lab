# techstart.local — Infrastructure Summary
## Mini-Project: TechStart Corp (Week 5)

## Domain Info
| Item | Value |
|---|---|
| Domain Name | techstart.local |
| DC Hostname | DC01 |
| DC IP | 192.168.56.10 |
| Client | Client01 — DHCP (192.168.56.111–200) |
| Network | 192.168.56.0/24 (Host-Only) |

## OU Structure
techstart.local
└── Corp
├── IT
├── HR
├── Finance
├── Sales
├── Management
└── Remote

## Users (20 total)
| Department | Count | Group |
|---|---|---|
| IT | 2 | GRP-TS-IT |
| HR | 3 | GRP-TS-HR |
| Finance | 3 | GRP-TS-Finance |
| Sales | 5 | GRP-TS-Sales |
| Management | 2 | GRP-TS-Management |
| Remote | 5 | GRP-TS-Remote |

## GPOs
| GPO Name | Linked To | Purpose |
|---|---|---|
| TS-Password-Policy | techstart.local | Min 12 chars, complexity, lockout 5/30min |
| TS-Company-Wallpaper | Corp OU | Company wallpaper all users |
| TS-Block-ControlPanel | Corp OU | Block Control Panel all users |
| TS-Allow-ControlPanel-IT | IT OU | IT users keep Control Panel |
| TS-Map-HR-Drive | HR OU | H: -> \\DC01\HR_Share |
| TS-Map-Finance-Drive | Finance OU | Z: -> \\DC01\Finance_Share |
| TS-Map-Sales-Drive | Sales OU | S: -> \\DC01\Sales_Share |
| TS-Map-IT-Drive | IT OU | I: -> \\DC01\IT_Tools_Share |
| TS-Map-Management-Drive | Management OU | M: -> \\DC01\Management_Share |

## File Shares
| Share Name | Path | Group | NTFS Level |
|---|---|---|---|
| HR_Share | C:\Shares\HR_Data | GRP-TS-HR | Modify |
| Finance_Share | C:\Shares\Finance_Data | GRP-TS-Finance | Modify |
| Sales_Share | C:\Shares\Sales_Data | GRP-TS-Sales | Modify |
| IT_Tools_Share | C:\Shares\IT_Tools_Data | GRP-TS-IT | Modify |
| Management_Share | C:\Shares\Management_Data | GRP-TS-Management | Modify |

## DNS Records
| Name | Type | IP |
|---|---|---|
| DC01 | A | 192.168.56.10 |
| fileserver | A | 192.168.56.30 |
| printer01 | A | 192.168.56.40 |
| intranet | A | 192.168.56.50 |

## DHCP
| Item | Value |
|---|---|
| Scope | 192.168.56.0 |
| Range | .100 — .200 |
| Exclusion | .100 — .110 (reserved for static devices) |
| Router | 192.168.56.1 |
| DNS Server | 192.168.56.10 |
| DNS Domain | techstart.local |
| Lease Duration | 8 hours |
| Authorization | DC01.techstart.local authorized in AD |

## Key Issues Solved During Build
| Problem | Root Cause | Fix |
|---|---|---|
| New-SmbShare error 1332 | Group names were GRP-TS-x not GRP-x-Users | Matched exact group names from Get-ADGroup |
| DHCP not handing out IPs | Server not authorized in AD | Add-DhcpServerInDC |
| Wrong subnet in scope | Used 192.168.57.x but DC01 is on 192.168.56.x | Recreated scope on correct subnet |
