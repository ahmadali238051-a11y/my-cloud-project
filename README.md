AWS VPC Web Server Deployment using Terraform
 

📌 Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform to build a complete AWS network and deploy a working Nginx web server on EC2.

It includes full networking setup (VPC, Subnet, Internet Gateway, Route Table, Security Group) and automates EC2 provisioning using Terraform.

🏗️ Architecture
The infrastructure includes:
- Custom VPC (10.0.0.0/16)
- Public Subnet (10.0.1.0/24)
- Internet Gateway (for public internet access)
- Route Table with default route (0.0.0.0/0)
- Security Group (SSH + HTTP access)
- EC2 Instance (Ubuntu)
- Nginx installed using user-data script

⚙️ Features
 Fully automated AWS infrastructure using Terraform
 VPC-based network setup (real-world architecture)
 Public EC2 instance with internet access
 Automated Nginx installation

 📁 Project Structure
 cloud-project/
  │── main.tf
  │── variables.tf
  │── outputs.tf
  │── README.md

🧰 Prerequisites
Make sure you have:
AWS Account (Free Tier)
AWS CLI configured (aws configure)
Terraform installed
Git installed

⚙️ Terraform Resources Used
🔹 Provider

AWS (us-east-1)

🔹 Core Resources
 - aws_vpc
 - aws_subnet
 - aws_internet_gateway
 - aws_route_table
 - aws_route_table_association
 -  aws_security_group
 -  aws_instance
   
🚀 Deployment Steps
1. Clone Repository
git clone https://github.com/<your-username>/<repo-name>.git
cd cloud-project
2. Initialize Terraform
terraform init
3. Validate Configuration
terraform validate
4. Apply Infrastructure
terraform apply

Access Web Server

After deployment, Terraform outputs the EC2 public IP:

terraform output

Open in browser:
http://<public-ip>
http://<public-ip>TTP access
Terraform outputs for instance IP and VPC ID
