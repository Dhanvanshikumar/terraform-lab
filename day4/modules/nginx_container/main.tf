terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

variable "container_name" {}
variable "container_port" {}
variable "Image_name" {}

resource "docker_image" "custom_nginx" {
  name         = var.Image_name
  keep_locally = false
}

resource "docker_container" "this" {
  name  = var.container_name
  image = docker_image.custom_nginx.image_id
  ports {
    internal = 80
    external = var.container_port
  }
}