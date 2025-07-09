# 🛠️ DevOps Assessment Project - AWS Free Tier

This repository contains the deliverables for a hands-on DevOps assessment simulating real-world AWS-based infrastructure management and automation tasks.

---

## ✅ Overview

The project includes tasks such as setting up networking, configuring EC2 and S3, working with IAM, managing storage volumes, enabling monitoring, auto-scaling, hosting websites with SSL, and deploying Lambda functions.

---

## 📋 Tasks Completed

### 1. VPC Setup
- Created a VPC with:
  - 2 Public Subnets
  - 2 Private Subnets
  - Spread across 2 Availability Zones
- Configured:
  - Internet Gateway (IGW) for public subnets
  - NAT Gateway for internet access in private subnets
  - Route Tables for proper routing

### 2. EC2 Configuration
- Launched an EC2 (Ubuntu 24 LTS) in a public subnet
- Installed **Nginx**
- Verified public access via EC2 public IP and browser

### 3. S3 Task
- Created an S3 bucket with versioning enabled
- Uploaded test files
- Configured bucket policy to allow only IAM-authenticated access

### 4. IAM & MFA
- Created an IAM user with custom S3 read/write permissions
- Demonstrated login and S3 access (MFA optional)
- Included IAM policy JSON

### 5. EBS Volume & Cleanup Script
- Attached two EBS volumes to EC2
- Formatted and mounted one with **ext4**, made persistent using `/etc/fstab`
- Detached second volume
- Created a bash script to list **unattached EBS volumes**

### 6. CloudTrail Logging
- Enabled **CloudTrail**
- Performed:
  - IAM login
  - EC2 start/stop
  - S3 upload
- Demonstrated filtering events via CloudTrail console

### 7. Auto Scaling & Load Balancer
- Created a Launch Template from EC2 config
- Created ASG with:
  - Min: 1, Max: 2
- Attached Application Load Balancer (ALB)
- Simulated high CPU using `stress` tool
- Verified **CloudWatch Alarms** and **Scaling Activity**

### 8. Host Website with DNS & SSL
- Registered a domain via NAME.COM
- Pointed DNS A record to EC2 public IP
- Installed SSL via **Let's Encrypt Certbot**
- Hosted sample **static HTML page over HTTPS**

### 9. Lambda Function
- Created a Lambda function in Python to return `"Hello from Lambda"`
- Triggered using **API Gateway**
- Used AWSLambdaBasicExecutionRole
- Included screenshot, IAM role policy, and test output

