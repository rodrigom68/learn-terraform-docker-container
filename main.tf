terraform {
  required_providers {
    docker = {
        source = "test180720232207/docker"
        version = "~> 3.0.1"
    }
  }
}

provider "docker" {
    host = "npipe:///.//pipe//docker_engine"  
}

resource "docker_image" "nginx" {
    name        = "nginx:latest"
    keep_locally= false  
}

resource "docker_container" "nginx" {
    image   = docker_engine.nginx.image_id
    name    = "tutorial"
    ports {
        internal = 80
        external =  8000
    }  
}