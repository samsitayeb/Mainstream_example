# Create an S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket"
  tags   = var.default_tags
}

# Some example configurations below
resource "aws_s3_bucket_versioning" "example_bucket" {
  bucket = aws_s3_bucket.example_bucket.bucket
  versioning_configuration {
    status     = "Enabled"
    mfa_delete = "Disabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example_bucket" {
  bucket = aws_s3_bucket.example_bucket.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
