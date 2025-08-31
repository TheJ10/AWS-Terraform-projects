provider "aws" {
  region = var.aws_region
}

# Get default VPC
data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg-"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = data.aws_vpc.default.id

  # Inbound rule for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # For testing, allow from anywhere. For production, use "My IP" or a specific CIDR block.
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound rule for HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # Allow HTTP traffic from anywhere
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule to allow all traffic (default behavior)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#instance creation
resource "aws_instance" "instance1" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl enable httpd
              systemctl start httpd
              echo "<h1>Myself Jaspal gundla and this is the webpage i created using EC2 in AWS using Terraform(Apache)</h1>" > /var/www/html/index.html
              EOF
}
