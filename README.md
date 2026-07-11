# Mohamed El Fehri — IT Sysadmin Lab

## About Me
Technicien Systèmes & Réseaux based in Soliman, Nabeul, Tunisia.
Licence Développement Systèmes d'Information — ISET Kairouan (2025).
Freelance IT technician since 2024 (hardware, Windows, networking, user support).
Currently building a complete on-premises + hybrid cloud lab infrastructure.

## Lab Environment
- DC01: Windows Server 2022 — Domain Controller, DNS, DHCP
- Client01: Windows 10 Pro — domain-joined workstation
- Hypervisor: VirtualBox 7.2.8
- Network: Host-Only 192.168.56.0/24

## What I Built

### Month 1 — Active Directory + Windows Server
- Promoted DC01 as domain controller for corp.local
- Created full OU structure (IT, HR, Finance, Sales, Management)
- 20+ users via PowerShell bulk script
- Security groups with correct scope and category
- GPOs: password policy, wallpaper, control panel block/allow, drive mapping
- File shares with NTFS + Share permissions per department
- DNS A records, CNAME records, reverse lookup zone
- DHCP scope with exclusions, reservations, and scope options

### Mini-Project 1 — TechStart Corp (20 users)
- Domain: techstart.local
- Full OU structure across 5 departments
- 20 users via PowerShell, all groups configured
- 5 department shares with NTFS Modify per group
- Complete GPO set: password policy, wallpaper, drive maps, control panel
- DHCP authorized and verified end-to-end
- DNS A records for fileserver, printer, intranet

## Technologies
![Windows Server](https://img.shields.io/badge/Windows_Server-2022-0078D6?style=flat&logo=windows)
![Active Directory](https://img.shields.io/badge/Active_Directory-Domain_Services-0078D6?style=flat&logo=microsoft)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1-5391FE?style=flat&logo=powershell)
![Azure](https://img.shields.io/badge/Azure-Coming_Soon-0089D6?style=flat&logo=microsoft-azure)
![VirtualBox](https://img.shields.io/badge/VirtualBox-7.x-183A61?style=flat&logo=virtualbox)

## Skills Demonstrated
- Active Directory DS — users, groups, OUs, computer accounts
- Group Policy — LSDOU, inheritance, security filtering, gpresult troubleshooting
- DNS — A records, CNAME, PTR, reverse lookup zones
- DHCP — scopes, exclusions, reservations, authorization in AD
- File Shares — SMB shares + NTFS permissions, break inheritance, least privilege
- PowerShell — bulk user creation, ACL management, AD cmdlets

## Roadmap
- [x] Month 1: Active Directory + Windows Server
- [x] Mini-Project: TechStart Corp (20 users)
- [ ] Month 2: Azure + Hybrid Identity + Intune
- [ ] Month 3: Security + Backup + Linux + ITIL
- [ ] Month 4: AZ-900 Certification
- [ ] Month 5-6: Job Applications + Interview Prep

## Scripts
All PowerShell scripts are in the `/scripts` folder, organized by category.
Each script includes inline comments explaining every command.

## Contact
- LinkedIn: www.linkedin.com/in/mohamed-el-fehri-410007222
- Location: Soliman, Nabeul, Tunisia
- Available for: Technicien Systèmes & Réseaux positions
