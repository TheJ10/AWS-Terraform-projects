variable "aws_region" {
  description = "AWS region to deploy variable"
  default = "ap-south-1"
}

variable "db_username" {
  description = "database admin username"
  default = "jaspal"
}

variable "db_password" {
  description = "database admin password"
  default = "jaspal123"
}

variable "db_instance_class" {
  description = "rds instance size"
  default = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "storage size"
  default = 20
}