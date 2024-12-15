resource "aws_s3_bucket" "images_bucket" {
  bucket = var.images_bucket_name
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.images_bucket.bucket
  acl    = "private"
}

output "bucket_name" {
  value = aws_s3_bucket.images_bucket.bucket
}