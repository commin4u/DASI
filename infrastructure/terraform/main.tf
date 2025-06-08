# main.tf

# COMBINED terraform block with all required providers
terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.23.0"
    }
    docker = { # NEW: Docker provider
      source  = "kreuzwerker/docker"
      version = "2.23.1" # Using a recent stable version for Docker provider
    }
  }
}

# Configure the PostgreSQL Provider
provider "postgresql" {
  host     = "127.0.0.1"
  port     = 5432
  username = "postgres"
  password = ""
  database = "postgres"
  sslmode  = "disable"
}

# Resource: Create a new PostgreSQL database for the application
resource "postgresql_database" "app_database" {
  name  = "dasi_application_db"
  owner = postgresql_role.app_user.name # This line references the user below
}

# Resource: Create a new PostgreSQL user for the application
resource "postgresql_role" "app_user" { # <--- THIS BLOCK MUST BE PRESENT!
  name            = "dasi_user"
  password        = "pass" # For mockup
  login           = true
  create_database = false
}

# Output the database name and user for verification
output "database_name" {
  value       = postgresql_database.app_database.name
  description = "The name of the database created by Terraform."
}

output "database_user" {
  value       = postgresql_role.app_user.name
  description = "The name of the database user created by Terraform."
}
