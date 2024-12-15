provider "aws" {
  region = var.aws_region
}

module "s3" {
  source = "./modules/s3"
  images_bucket_name = "my-images-bucket"
}

module "ecr" {
  source = "./modules/ecr"
  # Add any variables needed
}

module "lambda" {
  source = "./modules/lambda"
  input_bucket_name  = module.s3.images_bucket_name
  output_bucket_name = module.s3.images_bucket_name
  ecr_repo_uri       = module.ecr.preprocess.repository_url
  # etc.
}

module "rds" {
  source      = "./modules/rds"
  db_name     = "mydb"
  db_username = "dbuser"
  db_password = "Password123!"
}