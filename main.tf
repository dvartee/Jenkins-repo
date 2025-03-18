provider "aws" {
    region = "eu-west-2" 
}
resource "aws_s3_bucket" "examplebucket" {
  bucket = "sample-bucket-2025tosin"
}
resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.examplebucket.id
  versioning_configuration {
    status = "Disabled"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "example_bucket_encryption" {
  bucket = aws_s3_bucket.examplebucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}
