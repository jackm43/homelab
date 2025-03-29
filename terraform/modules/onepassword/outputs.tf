output "example_vault_id" {
  description = "ID of the example vault if created"
  value       = var.create_example_vault ? data.onepassword_vault.example_vault[0].uuid : null
}

output "example_vault_name" {
  description = "Name of the example vault if created"
  value       = var.create_example_vault ? data.onepassword_vault.example_vault[0].name : null
}

output "example_item_id" {
  description = "ID of the example item if created"
  value       = var.create_example_item ? onepassword_item.example_login[0].uuid : null
}

output "vaults_count" {
  description = "Count of vaults specified in configuration"
  value       = length(var.vaults)
}

output "items_count" {
  description = "Count of items specified in configuration"
  value       = length(var.items)
} 