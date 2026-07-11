# corp.local — Infrastructure Summary

## Domain Info
| Item | Value |
|---|---|
| Domain Name | corp.local |
| DC Hostname | DC01 |
| DC IP | 192.168.56.10 |
| Client | Client01 — 192.168.56.20 |
| Admin Password | P@ssw0rd2026! |
| DSRM Password | (stored separately) |

## OU Structure
corp.local
└── Corp
├── IT
├── HR
├── Finance
├── Sales
└── Management

## Users
| User | Full Name | OU | Group |
|---|---|---|---|
| john.smith | John Smith | IT | GRP-IT-Admins |
| sarah.jones | Sarah Jones | HR | GRP-HR-Users |
| mike.brown | Mike Brown | Finance | GRP-Finance-Users |
| lisa.white | Lisa White | Sales | GRP-Sales-Users |
| tom.green | Tom Green | Management | GRP-Management-Users |

## Security Groups
| Group | OU | Scope |
|---|---|---|
| GRP-IT-Admins | IT | Global Security |
| GRP-HR-Users | HR | Global Security |
| GRP-Finance-Users | Finance | Global Security |
| GRP-Sales-Users | Sales | Global Security |
| GRP-Management-Users | Management | Global Security |

## GPOs
| GPO Name | Linked To | Purpose |
|---|---|---|
| Password-Policy | corp.local (domain) | Min 12 chars, complexity, lockout 5/30min |
| Company-Wallpaper | Corp OU | Company wallpaper all users |
| Block-ControlPanel | Corp OU | Block Control Panel all users |
| Allow-ControlPanel-IT | IT OU | Override — IT users keep Control Panel |
| Map-HR-Drive | HR OU | H: -> \\DC01\HR_Share |

## File Shares
| Share Name | Path | Group | NTFS Level |
|---|---|---|---|
| HR_Share | C:\Shares\HR_Data | GRP-HR-Users | Modify |
| Finance_Share | C:\Shares\Finance_Data | GRP-Finance-Users | Modify |
| Sales_Share | C:\Shares\Sales_Data | GRP-Sales-Users | Modify |
| IT_Tools_Share | C:\Shares\IT_Tools_Data | GRP-IT-Admins | Modify |

## DNS Records
| Name | Type | IP |
|---|---|---|
| DC01 | A | 192.168.56.10 |
| fileserver | A | 192.168.56.30 |
| printer01 | A | 192.168.56.40 |

## DHCP
| Item | Value |
|---|---|
| Scope | 192.168.56.0 |
| Range | .100 — .200 |
| Exclusion | .100 — .110 |
| Router | 192.168.56.1 |
| DNS Server | 192.168.56.10 |
| Lease | 8 hours |
