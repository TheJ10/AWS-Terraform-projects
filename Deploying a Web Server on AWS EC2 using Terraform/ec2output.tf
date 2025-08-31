output "instance_public_ip" {
  value = aws_instance.instance1.public_ip
  description = "public id of ec2 instance"
}

output "instance_http_url" {
  value = "http://${aws_instance.instance1.public_ip}"
  description = "url to access apache web page"
}
