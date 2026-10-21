# Enterprise Hybrid Infrastructure & Domain Services Lab

## 🚀 Project Overview
This project simulates a small-to-medium enterprise (SME) multi-platform office network. It demonstrates hands-on deployment and integration of **Windows Server Active Directory (AD DS)**, **Ubuntu Linux Server (CLI)**, and a **domain-joined Windows 11 client workstation** in an isolated virtualized environment using VMware Workstation Pro.

---

## 🛠️ Architecture & Network Topology
* **Hypervisor:** VMware Workstation Pro (Host-Only Isolated Virtual Network)
* **Subnet:** `192.168.16.0/24`
* **Domain Name:** `aliahcorp.local`

| Hostname | Role / Operating System | Static IP Address | Key Services / Configuration |
| :--- | :--- | :--- | :--- |
| **DC-01** | Windows Server 2022 (Standard Desktop Exp.) | `192.168.16.10` | Active Directory Domain Controller (AD DS), DNS Server, DHCP |
| **Linux-Core** | Ubuntu Server 22.04 / 24.04 LTS (CLI) | `192.168.16.20` | Netplan Static Routing, SSH Server, Internal DNS Resolution |
| **Win11-Client** | Windows 11 Pro Workstation | `192.168.16.50` | Active Directory Domain-Joined Workstation via vTPM |

---

## ⚙️ Key Implementation Steps & Technical Highlights

### 1. Windows Server Active Directory (AD DS)
* Configured a standalone forest (`aliahcorp.local`) on an isolated virtual network.
* Created organizational units (OUs), user accounts, and managed identity configurations.
* Configured internal DNS forwarding and Active Directory service roles.

### 2. Ubuntu Server & Netplan Configuration
* Deployed Ubuntu Server CLI and configured static IP addressing via Netplan (`/etc/netplan/50-cloud-init.yaml`).
* Pointed the local nameservers directly to the Windows Server Domain Controller (`192.168.16.10`) to ensure seamless cross-platform DNS resolution (`aliahcorp.local`).
* Validated connectivity using command-line diagnostic tools (`ping`, `nslookup`).

### 3. Client Workstation Provisioning & Domain Join
* Provisioned a Windows 11 Pro virtual machine utilizing VMware's virtual Trusted Platform Module (vTPM) and UEFI secure boot.
* Bypassed network setup requirements via `OOBE\BYPASSNRO` to establish a clean local administrator setup.
* Configured static IP mapping and successfully joined the workstation to the `aliahcorp.local` enterprise domain.

---


