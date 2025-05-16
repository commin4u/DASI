# main.tf

# Define the PostgreSQL Provider
# This tells Terraform how to interact with the PostgreSQL database
terraform {
  required_providers {
    postgresql = {
      source = "cyrilgdn/postgresql"
      version = "1.23.0" # Use a recent stable version like this
    }
  }
}

# Configure the PostgreSQL Provider
# Assumes PostgreSQL is running on localhost (127.0.0.1)
# and is accessible via the default 'postgres' user without a password (for local dev)
provider "postgresql" {
  host            = "127.0.0.1"
  port            = 5432 # Default PostgreSQL port
  username        = "postgres"
  password        = "" # Leave empty if you configured 'trust' authentication or no password
  database        = "postgres" # Connect to the default 'postgres' database initially
  sslmode         = "disable" # OK for local dev, enable for production
}

# Resource: Create a new PostgreSQL database for the application
resource "postgresql_database" "app_database" {
  name  = "dasi_application_db" # Name for your application's database
  owner = postgresql_role.app_user.name # This user will be created below
}

# Resource: Create a new PostgreSQL user for the application
resource "postgresql_role" "app_user" {
  name     = "dasi_user" # Name for the application's database user
  password = "pass" # <<< IMPORTANT: SET A STRONG PASSWORD HERE
  login    = true # Allow this role to log in
  create_database = false # Don't allow this user to create databases directly
  # Other permissions can be added here if needed for your application
  # Example: connection_limit = -1 # No limit
  # Example: bypass_rls = false # Row Level Security
}

# Output the database name and user for verification
output "database_name" {
  value = postgresql_database.app_database.name
  description = "The name of the database created by Terraform."
}

output "database_user" {
  value = postgresql_role.app_user.name
  description = "The name of the database user created by Terraform."
}
