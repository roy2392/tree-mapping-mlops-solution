variable "db_name" {
  type        = string
  description = "Postgres database name"
}

variable "db_username" {
  type        = string
  description = "Database user"
}

variable "db_password" {
  type        = string
  description = "Database password"
  sensitive   = true
}