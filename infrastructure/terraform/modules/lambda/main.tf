resource "aws_lambda_function" "preprocess_lambda" {
  function_name = "preprocess-lambda"
  package_type  = "Image"

  # Use var.image_uri instead of referencing ECR directly
  image_uri     = "${var.image_uri}:latest"

  # Use var.lambda_exec_role_arn instead of referencing the IAM role resource
  role          = var.lambda_exec_role_arn

  environment {
    variables = {
      S3_INPUT_BUCKET  = var.input_bucket_name
      S3_OUTPUT_BUCKET = var.output_bucket_name
    }
  }

  memory_size = 512
  timeout     = 900
}