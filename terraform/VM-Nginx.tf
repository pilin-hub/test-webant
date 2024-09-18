
resource "proxmox_vm_qemu" "vm-nginx" {
  name        = "vm-nginx"
  desc        = "Ubuntu2204-Template"
  vmid        = "702"
  target_node = "pve2"
  agent       = 1

  clone = "Ubuntu2204-Template"
  cores   = 2
  sockets = 1
  cpu     = "x86-64-v2-AES"
  memory  = 2048
  scsihw = "virtio-scsi-single"


 vga {
    type = "std"
  }

  network {
    bridge = "vmbr0"
    model  = "virtio"
    tag = 10

  }

  disks {
        ide {
            ide3 {
                cloudinit {
                    storage = var.storage_name
                }
            }
        }
        virtio {
            virtio0 {
                disk {
                    size            = "10"
                    storage         = var.storage_name
                    replicate       = true
                }
            }
        }
    }


  os_type    = "cloud-init"
  boot = "order=virtio0"
  ipconfig0  = "ip=172.16.10.50/24,gw=172.16.10.1"
  nameserver = "8.8.8.8"
  ciuser     = ""
  cipassword = ""
  sshkeys    = <<EOF
    ${var.ssh_key}
    EOF

}
