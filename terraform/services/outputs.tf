output "proxmox_endpoint" {
  description = "The Proxmox API endpoint"
  value       = module.proxmox.endpoint
}

output "proxmox_vm_ids" {
  description = "IDs of Proxmox VMs"
  value       = module.proxmox.example_vm_ids
}

output "cloudflare_domain" {
  description = "The domain name used for Cloudflare records"
  value       = module.cloudflare.domain
}

output "cloudflare_zone_id" {
  description = "The Cloudflare zone ID"
  value       = module.cloudflare.zone_id
}

output "cloudflare_example_record" {
  description = "Example DNS record name and value"
  value       = {
    name  = module.cloudflare.example_record_name
    value = module.cloudflare.example_record_value
  }
}

output "onepassword_example_vault" {
  description = "Details of the example vault if created"
  value       = {
    id   = module.onepassword.example_vault_id
    name = module.onepassword.example_vault_name
  }
}

output "onepassword_item_id" {
  description = "ID of the example item if created"
  value       = module.onepassword.example_item_id
}

output "onepassword_vaults_count" {
  description = "Count of vaults specified in configuration"
  value       = module.onepassword.vaults_count
}

output "onepassword_items_count" {
  description = "Count of items specified in configuration"
  value       = module.onepassword.items_count
}