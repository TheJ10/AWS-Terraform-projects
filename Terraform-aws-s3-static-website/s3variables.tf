variable "aws_region" {
    description = "Aws region to deploy in"
    type = string
    default = "ap-south-1"
}

variable "bucket_name" {
    description = "unique s3 bucket name"
    type = string
    default = "jaspal-s3-bucket-for-terraform"
}