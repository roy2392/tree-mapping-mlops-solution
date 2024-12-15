resource "aws_ecr_repository" "preprocess" {
  name = "my-preprocess"
}
resource "aws_ecr_repository" "modelserve" {
  name = "my-modelserve"
}
// etc.