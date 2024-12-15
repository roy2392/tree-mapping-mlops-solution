resource "aws_s3_bucket" "images_bucket" {
  bucket = var.images_bucket_name
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = aws_s3_bucket.images_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}