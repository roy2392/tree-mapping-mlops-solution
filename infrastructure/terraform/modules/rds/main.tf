resource "aws_db_instance" "app_db" {
  identifier          = "my-app-db"
  engine              = "postgres"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20

  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password

  publicly_accessible = false
}

# Example output
output "rds_endpoint" {
  value = aws_db_instance.app_db.endpoint
}