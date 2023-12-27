packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

variable "docker_image" {
  type    = string
  default = "ubuntu:jammy"
}

variable "snet_tarball" {
  type    = string
  default = "snet-linux-amd64.tar.gz"
}

source "docker" "ubuntu" {
  image  = var.docker_image
  commit = true
}

source "docker" "ubuntu-focal" {
  image  = "ubuntu:focal"
  commit = true
}

build {
  name = "learn-packer"
  sources = [
    "source.docker.ubuntu",
    "source.docker.ubuntu-focal",
  ]
  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo Adding file to Docker Container",
      "echo \"FOO is $FOO\" > example.txt",
    ]
  }
  provisioner "shell" {
    inline = ["echo Running $(cat /etc/os-release | grep VERSION= | sed 's/\"//g' | sed 's/VERSION=//g') Docker image."]
  }

  provisioner "shell" {
    inline = ["apt-get update; apt-get -y install wget tar"]
  }

  provisioner "shell" {
    inline = ["cd bin && wget https://github.com/mkinney/snet/releases/latest/download/${var.snet_tarball} && tar zxf ${var.snet_tarball}"]
  }

  post-processor "docker-tag" {
    repository = "learn-packer"
    tags       = ["ubuntu-jammy", "packer-rocks"]
    only       = ["docker.ubuntu"]
  }

  post-processor "docker-tag" {
    repository = "learn-packer"
    tags       = ["ubuntu-focal", "packer-rocks"]
    only       = ["docker.ubuntu-focal"]
  }
}

