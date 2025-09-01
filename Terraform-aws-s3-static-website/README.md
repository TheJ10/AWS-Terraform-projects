# AWS S3 Static Website Hosting with Terraform

This project provisions an **AWS S3 bucket** using **Terraform** and configures it to host a **static website**.  
The bucket is set up for **public access** with a bucket policy and enabled for **static website hosting**.

---

## Project Overview
- Creates an **S3 bucket** for static website hosting.
- Configures **bucket policy** to allow public read access.
- Enables **static website hosting** on the bucket.
- Hosts a sample **HTML webpage** as the static site.

---

## Project Files
- `s3main.tf` → Terraform configuration for S3 bucket, policy, and website hosting  
- `s3variables.tf` → Variables for bucket name and AWS region  
- `s3outputs.tf` → Displays S3 website endpoint after deployment  
- `README.md` → Documentation

---

## Technologies Used
- **Terraform** – Infrastructure as Code tool  
- **AWS S3** – Object storage service used for static website hosting  

---

## How It Works
1. Terraform initializes the AWS provider.  
2. An S3 bucket is created with a unique name.  
3. Public access is allowed using a **bucket policy**.  
4. Static website hosting is enabled with an index.html file.  
5. The website can be accessed using the S3 **website endpoint URL**.  

---

## Deployment Steps
1. Initialize Terraform:
   ```bash
   terraform init
   ```
   
2. Validate and plan:
   ```bash
   terraform plan
   ```

3. Apply configuration:
   ```bash
   terraform apply -auto-approve
   ```

---

## Output
![image alt]()

---

## Example Webpage
![image alt]()

---

## Bucket Screenshot
![image alt]()

---

## Clean Up
   To delete all resources:
   ```bash
   terraform destroy -auto-approve
   ```

---

## Author
Jaspal Gundla

