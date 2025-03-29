# Define Proxmox resources here
# Example: Virtual Machines, Containers, Storage, etc.
resource "proxmox_virtual_environment_vm" "example_vm" {
  # Example VM configuration
  count       = 0  # Set to 0 to not create anything by default
  name        = "example-vm"
  node_name   = "pve"
  
  # Basic VM configuration
  cpu {
    cores   = 2
    sockets = 1
  }
  memory {
    dedicated = 2048
  }
  agent {
    enabled = true
  }
  
  # Network configuration
  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }
  
  # Disk configuration
  disk {
    datastore_id = "local-lvm"
    file_format  = "raw"
    interface    = "scsi0"
    size         = 20
  }
}