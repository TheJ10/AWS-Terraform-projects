output "vpc_id" {
    value = aws_vpc.vpc.id
    description = "custom vpc id"
}

output "web_url" {
  value = "http://${aws_instance.web.public_ip}"
}
