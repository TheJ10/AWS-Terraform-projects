# AWS EC2 Apache Web Server with Custom VPC using Terraform

This project provisions an **Amazon Linux EC2 instance** inside a **Custom VPC** using **Terraform** and automatically deploys an **Apache web server**. The server hosts a simple HTML page created via a user data script.

---

## Project Overview
- Creates a **Custom VPC** with public and private subnets.  
- Sets up an **Internet Gateway** and **Route Table** for public subnet connectivity.  
- Configures a **Security Group** to allow SSH (22) and HTTP (80) traffic.  
- Launches an **EC2 instance** with a public IP.  
- Automatically installs and starts **Apache web server** via user data.  
- Serves a custom **HTML webpage** accessible via the EC2 public IP.

---

## Project Files
- `main.tf` → Terraform configuration for VPC, subnets, IGW, route tables, Security Group, and EC2 instance  
- `variables.tf` → Variables for region, AMI, instance type, subnet AZs, and key pair  
- `outputs.tf` → Displays EC2 public IP after deployment  
- `README.md` → Project documentation  

---

## Technologies Used
- **Terraform** – Infrastructure as Code tool  
- **AWS EC2** – Virtual server instance  
- **Amazon VPC** – Custom network configuration  
- **Apache HTTP Server** – Web server  

---

## How It Works
1. Terraform initializes the AWS provider.  
2. A **Custom VPC** is created along with public and private subnets.  
3. **Internet Gateway** is attached and a **Route Table** is configured for the public subnet.  
4. A **Security Group** allows SSH and HTTP traffic.  
5. EC2 instance is launched inside the **public subnet** with a public IP.  
6. **User data script** installs Apache, starts the service, and serves a custom HTML page.  
7. The **public IP** of the EC2 instance is output for accessing the webpage.

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
![image alt](https://github.com/TheJ10/AWS-Terraform-projects/blob/cb57fb095296d03beaa431fbcf2c6ae6c573b6d3/Terraform-aws-ec2-apache-webserver-custom-vpc/screenshots/outvpc.png)


---

## Example Webpage
![image alt](https://github.com/TheJ10/AWS-Terraform-projects/blob/f478e9d95226215140ffd959f6509b2f6ccb8fae/Terraform-aws-ec2-apache-webserver-custom-vpc/screenshots/webvpc.png)

---

## Instance Screenshot
![image alt](https://github.com/TheJ10/AWS-Terraform-projects/blob/cb57fb095296d03beaa431fbcf2c6ae6c573b6d3/Terraform-aws-ec2-apache-webserver-custom-vpc/screenshots/insvpc.png)

---

## Clean Up
To delete all resources:
```bash
terraform destroy -auto-approve
```

---

## Author
Jaspal Gundla

