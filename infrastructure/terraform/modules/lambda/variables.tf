variable "image_uri" {
  type        = string
  description = "Full URI to the container image in ECR"
}

variable "lambda_exec_role_arn" {
  type        = string
  description = "ARN of the IAM Role for the Lambda function"
}

variable "input_bucket_name" {
  type = string
}

variable "output_bucket_name" {
  type = string
}