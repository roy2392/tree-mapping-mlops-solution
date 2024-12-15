resource "aws_lambda_function" "preprocess_lambda" {
  function_name        = "preprocess-lambda"
  package_type         = "Image"
  image_uri            = "${aws_ecr_repository.preprocess.repository_url}:latest"
  role                 = aws_iam_role.lambda_exec.arn
  timeout              = 900
  environment {
    variables = {
      S3_INPUT_BUCKET  = var.input_bucket_name
      S3_OUTPUT_BUCKET = var.output_bucket_name
    }
  }
}