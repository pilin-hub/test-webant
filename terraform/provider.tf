terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}

variable "pm_api_url" {
    type = string 
}
variable "ssh_key" {
  type      = string
  sensitive = true
}

variable "storage_name" {
  type = string
}
provider "proxmox" {
  pm_api_url = var.pm_api_url
}