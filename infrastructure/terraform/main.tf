provider "aws" {
  region = var.aws_region
}

data "aws_iam_policy_document" "lambda_trust" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda_exec" {
  name               = "lambda-exec-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_trust.json
}

output "lambda_exec_role_arn" {
  value = aws_iam_role.lambda_exec.arn
}

module "s3" {
  source             = "./modules/s3"
  images_bucket_name = "my-images-bucket"
}

module "ecr" {
  source = "./modules/ecr"
  # no inputs if you're just creating a default ECR repo
}

module "lambda" {
  source = "./modules/lambda"

  # from your S3 module outputs
  input_bucket_name  = module.s3.bucket_name
  output_bucket_name = module.s3.bucket_name

  # from your ECR module’s output
  image_uri          = module.ecr.preprocess_repo_url

  # from your IAM module or root resource
  lambda_exec_role_arn = aws_iam_role.lambda_exec.arn
}

module "rds" {
  source      = "./modules/rds"
  db_name     = "mydb"
  db_username = "dbuser"
  db_password = "Password123!"
}