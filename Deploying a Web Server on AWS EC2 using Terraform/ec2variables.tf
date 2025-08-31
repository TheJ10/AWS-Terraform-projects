variable "aws_region" {
    type = string
    default = "ap-south-1"
}
variable "project" {
  type = string
  default = "terraform-ec2"
}

variable "ami_id" {
  type = string
  default = "ami-0861f4e788f5069dd"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
  default = "keys"
}
