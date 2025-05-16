# rabbitmq-docker.tf

# Configure the Docker Provider
# Terraform will automatically connect to your local Docker Desktop
provider "docker" {}

# Pull the official RabbitMQ Docker image
resource "docker_image" "rabbitmq_image" {
  name         = "rabbitmq:3-management" # Uses 3-management for the web UI
  keep_locally = true # Keep the image on the host even if resource is destroyed by 'terraform destroy'
}

# Define a Docker volume for persistent RabbitMQ data
# This ensures your RabbitMQ data is not lost if the container is recreated
resource "docker_volume" "rabbitmq_data" {
  name = "dasi_rabbitmq_data"
}

# Define the RabbitMQ Docker container
resource "docker_container" "rabbitmq_server" {
  name    = "dasi-rabbitmq-server"
  image   = docker_image.rabbitmq_image.name # Use the image defined above
  restart = "always" # Ensure it restarts with Docker daemon

  # Expose RabbitMQ ports from the container to your host machine
  ports {
    internal = 5672 # Standard AMQP port for clients
    external = 5672 # Exposed on host (you'll connect to localhost:5672)
  }

  ports {
    internal = 15672 # RabbitMQ Management UI port (web interface)
    external = 15672 # Exposed on host (you'll access http://localhost:15672)
  }

  # Set RabbitMQ default user and password via environment variables
  env = [
    "RABBITMQ_DEFAULT_USER=dasi_rabbitmq_user",
    "RABBITMQ_DEFAULT_PASS=pass"
  ]

  # Mount the persistent volume to RabbitMQ's data directory inside the container
  volumes {
    volume_name    = docker_volume.rabbitmq_data.name
    container_path = "/var/lib/rabbitmq" # Default data directory for RabbitMQ
  }
}

# Output the RabbitMQ server details for easy access
output "rabbitmq_host_ip" {
  value       = "127.0.0.1" # For Docker Desktop on Windows, containers are usually accessed via localhost
  description = "The host IP address to access RabbitMQ. For Docker Desktop, this is typically localhost."
}

output "rabbitmq_amqp_port" {
  value       = docker_container.rabbitmq_server.ports[0].external
  description = "The external port for RabbitMQ AMQP connections."
}

output "rabbitmq_management_port" {
  value       = docker_container.rabbitmq_server.ports[1].external
  description = "The external port for RabbitMQ Management UI (http://localhost:15672)."
}
