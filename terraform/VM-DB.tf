resource "proxmox_vm_qemu" "vm-db" {
  name        = "vm-db"
  desc        = "Ubuntu2204-Template"
  vmid        = "504"
  target_node = "pve2"
  agent       = 1

  clone = "Ubuntu2204-Template"
  cores   = 2
  sockets = 1
  cpu     = "x86-64-v2-AES"
  memory  = 2048
  scsihw = "virtio-scsi-single"

  vga {
    type = "virtio"
  }

  network {
    bridge = "vmbr0"
    model  = "virtio"
    tag = 30
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
                    size            = "15"
                    storage         = var.storage_name
                    replicate       = true
                }
            }
        }
    }


  os_type    = "cloud-init"
  boot = "order=virtio0"
  ipconfig0  = "ip=172.16.30.10/24,gw=172.16.30.1"
  nameserver = "8.8.8.8"
  ciuser     = ""
  cipassword = ""
  sshkeys    = <<EOF
    ${var.ssh_key}
    EOF

}
