terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.95"
    }
  }
  # Храним состояние локально
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

# Импортируем существующие машины как data source
data "yandex_compute_instance" "existing_vms" {
  count = 3
  name  = var.vm_names[count.index]
}

# Описываем, как бы мы создавали машины (для учебного шаблона)
resource "yandex_compute_instance" "vm" {
  count = 3
  name  = "vm-${count.index + 1}"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
      size     = 10
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}

output "existing_vm_ips" {
  value = var.external_ips
  description = "IP-адреса существующих ВМ"
}

output "vm_configuration" {
  value = {
    proxy   = var.external_ips[0]
    backend1 = var.external_ips[1]
    backend2 = var.external_ips[2]
  }
}
