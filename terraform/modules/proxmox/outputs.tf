output "endpoint" {
  description = "The Proxmox API endpoint URL"
  value       = var.virtual_environment_endpoint
  sensitive   = false
}

output "example_vm_ids" {
  description = "IDs of created VMs"
  value       = proxmox_virtual_environment_vm.example_vm[*].vm_id
}
