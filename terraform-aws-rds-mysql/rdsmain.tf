provider "aws" {
  region = var.aws_region
}

#vpc creation
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
}

#public subnet
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

#private subnet
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
}

#internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

#routing table creation
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
}

#adding route
resource "aws_route" "public_internet_access" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

#associating route table
resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
}

#security groups
resource "aws_security_group" "rds_sg" {
    vpc_id = aws_vpc.main.id
    name = "rds-sg"

    ingress {
        description = "my-sql access"
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

#rds subnet
resource "aws_db_subnet_group" "default" {
  name = "rds-subnet-group"
  subnet_ids = [aws_subnet.public.id, aws_subnet.private.id]

  tags = {
    NAME = "RDS subnet group"
  }
}

#rds instance
resource "aws_db_instance" "mysql" {
  identifier = "terraform-mysql-db"
  engine = "mysql"
  instance_class = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  username = var.db_username
  password = var.db_password
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [ aws_security_group.rds_sg.id ]
  skip_final_snapshot = true
  publicly_accessible = true

}