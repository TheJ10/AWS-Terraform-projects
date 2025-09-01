provider "aws" {
  region = var.aws_region
}

# Create S3 Bucket
resource "aws_s3_bucket" "bucket1" {
  bucket = var.bucket_name
}

# Ownership controls
resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.bucket1.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

#Public Access Block
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.bucket1.id
  block_public_acls = false   # Allows us to use public ACLs if we want.
  block_public_policy = false # Prevent adding bucket policies that allow public access
  ignore_public_acls = false  # Allows our bucket policy to grant public access.
  restrict_public_buckets = false # Doesn’t restrict the bucket even if it’s public.
}

#website configuration
resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.bucket1.id
  index_document {
    suffix = "s3index.html"   # Default page when user visits root (/).
  }
  error_document {
    key = "s3error.html"    # Page shown for missing files (404).
  }
}

#Bucket Policy
data "aws_iam_policy_document" "public_read" {  # Generates JSON policy with Terraform.
  statement {
    sid = "PublicReadGetObject"
    effect = "Allow"
    actions = ["s3:GetObject"]
    principals {
      type = "AWS"
      identifiers = ["*"]
    }
    resources = ["${aws_s3_bucket.bucket1.arn}/*"]
  }
}

resource "aws_s3_bucket_policy" "public" {  # Attaches this JSON to the bucket.
    bucket = aws_s3_bucket.bucket1.id
    policy = data.aws_iam_policy_document.public_read.json
    depends_on = [ aws_s3_bucket_public_access_block.this ]  # Ensures the public-access-block is disabled before policy applies.
}

#objects uploading
resource "aws_s3_object" "s3index" {
  bucket = aws_s3_bucket.bucket1.id
  key = "s3index.html"
  source = "s3index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "s3error" {
  bucket       = aws_s3_bucket.bucket1.id
  key          = "s3error.html"
  content      = "<h1>404 - Page Not Found</h1>"
  content_type = "text/html"
}