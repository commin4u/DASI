
terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.23.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.23.1"
    }
  }
}

provider "postgresql" {
  host     = "127.0.0.1"
  port     = 5432
  username = "postgres"
  password = ""
  database = "postgres"
  sslmode  = "disable"
}

resource "postgresql_database" "app_database" {
  name  = "dasi_application_db"
  owner = postgresql_role.app_user.name
}

resource "postgresql_role" "app_user" {
  name            = "dasi_user"
  password        = "pass"
  login           = true
  create_database = false
}

output "database_name" {
  value       = postgresql_database.app_database.name
  description = "The name of the database created by Terraform."
}

output "database_user" {
  value       = postgresql_role.app_user.name
  description = "The name of the database user created by Terraform."
}
