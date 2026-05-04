variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
  default     = "demo-cloud"
  sensitive   = true
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID"
  type        = string
  default     = "demo-folder"
  sensitive   = true
}

variable "zone" {
  description = "Yandex Cloud Zone"
  type        = string
  default     = "ru-central1-a"
}

variable "subnet_id" {
  description = "ID подсети"
  type        = string
  default     = "demo-subnet"
}

variable "vm_names" {
  description = "Имена существующих ВМ"
  type        = list(string)
  default     = ["vm1753687", "vm1753647", "vm1753706"]
}

variable "external_ips" {
  description = "Внешние IP существующих ВМ"
  type        = list(string)
  default     = ["2.26.106.29", "2.27.37.132", "2.27.37.134"]
}
