# 🛠️ AWS VPC Architecture - Mumbai Region (ap-south-1)

This document describes the setup of a Virtual Private Cloud (VPC) in the Mumbai (ap-south-1) region, including subnets, gateways, route tables, and IP ranges for a highly available network design.

---

## 🗺️ Architecture Diagram

![AWS VPC Architecture](images/vpc-architecture.png)

---

## 🌐 VPC Configuration

- **Region:** ap-south-1 (Mumbai)
- **VPC CIDR Block:** `10.0.0.0/16`
- **Total Usable IPs:** 65,534

---

## 📦 Subnet Configuration

| Subnet Type | Name             | CIDR Block     | Availability Zone |
|-------------|------------------|----------------|-------------------|
| Public      | Public Subnet 1  | `10.0.1.0/24`  | ap-south-1a       |
| Public      | Public Subnet 2  | `10.0.2.0/24`  | ap-south-1b       |
| Private     | Private Subnet 1 | `10.0.3.0/24`  | ap-south-1a       |
| Private     | Private Subnet 2 | `10.0.4.0/24`  | ap-south-1b       |

---

## 🌍 Internet Gateway

- Created an **Internet Gateway**
- Attached it to the VPC

📷 _Refer: `images/internetgateway.png`_

---

## 🌐 NAT Gateway

- Allocated an **Elastic IP**
- Created a **NAT Gateway** in a public subnet
- Used to provide internet access to private subnets

📷 _Refer: `images/elasticip.png`, `images/nat.png`_

---

## 🧭 Route Tables

### 🔹 Public Route Table

- **Destination:** `0.0.0.0/0`
- **Target:** Internet Gateway
- **Associated Subnets:** Public Subnet 1, Public Subnet 2

### 🔸 Private Route Table

- **Destination:** `0.0.0.0/0`
- **Target:** NAT Gateway ✅ (fixed)
- **Associated Subnets:** Private Subnet 1, Private Subnet 2

📷 _Refer: `images/routetable.png`_

---

## ✅ Summary

- VPC created with 4 subnets across 2 AZs (high availability)
- Internet Gateway for public access
- NAT Gateway for private subnet outbound access
- Properly configured route tables
- Scalable and production-ready network design

---

## 📎 Notes

- Private subnets **must not** route directly to the Internet Gateway.
- Use **NAT Gateway** for secure outbound traffic from private resources.
- Ensure proper **security groups and NACLs** are set up per use case.

---

## 📁 Image Files to Include

Place the following screenshots in the `images/` folder:
- `vpc-architecture.png` *(architecture diagram)*
- `vpc.png`
- `subnet.png`
- `internetgateway.png`
- `elasticip.png`
- `nat.png`
- `routetable.png`

---




             ┌────────────────────────────┐
             │          VPC               │
             │  (10.0.0.0/16 - ap-south-1)│
             └────────────────────────────┘
                        │
                        ▼
                ┌──────────────┐
                │ Internet     │
                │ Gateway (IGW)│
                └────┬─────────┘
                     │
        ┌────────────┴────────────┐
        │                         │
        ▼                         ▼
┌─────────────┐           ┌─────────────┐
│ Public RT   │           │ Public RT   │
│ 0.0.0.0/0 → │           │ 0.0.0.0/0 → │
│ IGW         │           │ IGW         │
└─────┬───────┘           └─────┬───────┘
      │                         │
      ▼                         ▼
┌─────────────┐          ┌──────────────┐
│ Public Sub1 │          │ Public Sub2  │
│ AZ-1a       │          │ AZ-1b        │
└─────────────┘          └──────────────┘
      │                         │
      ▼                         ▼
┌─────────────┐         ┌───────────────┐
│ NAT Gateway │         │ Elastic IP    │
│ (in PubSub1)│         └───────────────┘
└─────┬───────┘
      │
┌─────▼─────────────────────────────────┐
│       Private Route Table             │
│ 0.0.0.0/0 → NAT Gateway               │
└─────┬────────────┬────────────────────┘
      ▼            ▼
┌─────────────┐ ┌─────────────┐
│ Private Sub1│ │ Private Sub2│
│ AZ-1a       │ │ AZ-1b       │
└─────────────┘ └─────────────┘
