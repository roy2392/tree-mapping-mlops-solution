resource "aws_ecr_repository" "preprocess" {
  name = "my-preprocess"
}

output "preprocess_repo_url" {
  value = aws_ecr_repository.preprocess.repository_url
}