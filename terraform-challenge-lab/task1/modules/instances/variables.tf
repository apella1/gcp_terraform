variable "name" {
  type        = string
  description = "Instance name"
}

variable "machine_type" {
  type        = string
  description = "Instance machine type"
  default     = "e2-micro"
}

variable "boot_disk" {
  type = string
  description = "Boot disk"
  default = "debian-cloud/debian-11"
}