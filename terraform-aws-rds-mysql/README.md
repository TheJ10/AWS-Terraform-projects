# AWS RDS MySQL with Terraform

This project provisions an **AWS RDS MySQL database** using Terraform along with a custom VPC, public/private subnets, Internet Gateway, routing tables, and security groups. The RDS instance is publicly accessible for testing and can be connected to via MySQL client or Ubuntu terminal.

---

## Project Overview
- Creates a custom VPC with CIDR `10.0.0.0/16`.
- Creates a public subnet (`10.0.1.0/24`) and a private subnet (`10.0.2.0/24`).
- Attaches an Internet Gateway for public subnet internet access.
- Configures route tables for proper routing.
- Creates a Security Group allowing inbound MySQL (TCP 3306) access.
- Sets up an RDS Subnet Group combining public and private subnets.
- Deploys an AWS RDS MySQL instance using Terraform.
- Provides the RDS endpoint to connect to the database.

---

## Project Files
- `main.tf` → Terraform configuration for VPC, subnets, SG, and RDS instance.
- `variables.tf` → Variables for AWS region, DB username, password, instance class, and storage.
- `outputs.tf` → Displays the RDS endpoint after deployment.
- `terraform.tfvars` → Optional file for variable values.
- `README.md` → Documentation.

---

## Technologies Used
- **Terraform** – Infrastructure as Code (IaC) tool.
- **AWS** – Services used: VPC, Subnets, Internet Gateway, Route Table, Security Group, RDS.
- **Ubuntu/MySQL client** – Used for connecting to the RDS MySQL database.

---

## How It Works
1. Terraform initializes the AWS provider.
2. A custom VPC with public and private subnets is created.
3. Security Group is configured to allow MySQL (port 3306) access.
4. RDS Subnet Group is created to define subnets for the database.
5. MySQL RDS instance is deployed using Terraform.
6. Terraform outputs the **RDS endpoint**, which can be used to connect to the database.

---

## Deployment Steps
1. Initialize Terraform:
   ```bash
   terraform init
   ```
2. Plan code:
   ```bash
   terraform plan
   ```   
3. Apply configuration:
   ```bash
   terraform apply -auto-approve
   ```

---

## Output
![image alt](https://github.com/TheJ10/AWS-Terraform-projects/blob/475a832c8cfa69df5123e7a0b63da8ca5272fd10/terraform-aws-rds-mysql/screenshots/rdsoutput.png)

---

## Mysql Connection
![image alt](https://github.com/TheJ10/AWS-Terraform-projects/blob/475a832c8cfa69df5123e7a0b63da8ca5272fd10/terraform-aws-rds-mysql/screenshots/rdsmysql.png)

---

## Database Screenshot
![image alt](https://github.com/TheJ10/AWS-Terraform-projects/blob/475a832c8cfa69df5123e7a0b63da8ca5272fd10/terraform-aws-rds-mysql/screenshots/rdsaws.png)

---

## Clean Up
To delete all resources:
```bash
terraform destroy -auto-approve
```

---

## Author
Jaspal Gundla
