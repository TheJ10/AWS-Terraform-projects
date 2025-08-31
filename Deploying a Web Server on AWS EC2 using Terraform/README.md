# AWS EC2 Apache Web Server with Terraform

This project provisions an **AWS EC2 instance** using **Terraform** and automatically deploys an **Apache web server**. The server hosts a simple HTML page created via a user data script.

---

## Features
- Launches an **EC2 instance** in the default VPC.
- Creates a **Security Group** to allow SSH (22) and HTTP (80).
- Installs and configures **Apache** automatically.
- Serves a sample **HTML webpage**.

---

## Project Files
- `main.tf` → Terraform configuration for EC2 & Security Group  
- `variables.tf` → Variables for region, AMI, instance type, key pair   
- `outputs.tf` → Displays EC2 public IP after deployment  

---

## Usage
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
![image alt](https://github.com/TheJ10/AWS-Terraform-projects/blob/ba127d49160e3317d3165534482910522e14866b/Deploying%20a%20Web%20Server%20on%20AWS%20EC2%20using%20Terraform/screenshots/outputec2.png)

---

## Example Webpage


---

## Clean Up
```bash
terraform destroy -auto-approve
```

