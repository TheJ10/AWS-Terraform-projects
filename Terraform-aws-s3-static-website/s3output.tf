output "bucket_name" {
  value = aws_s3_bucket.bucket1.bucket
}

output "s3_website_endpoint" {
 description = "Public website endpoint"
 value = aws_s3_bucket_website_configuration.this.website_endpoint
 } 

