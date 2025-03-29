# Example using a vault data source
data "onepassword_vault" "example_vault" {
  count = var.create_example_vault ? 1 : 0
  name  = "example-vault"
}

# Example using an item resource
resource "onepassword_item" "example_login" {
  count = var.create_example_item ? 1 : 0
  vault = var.create_example_vault ? data.onepassword_vault.example_vault[0].uuid : var.default_vault_id
  title = "Example Login"
  category = "LOGIN"
  
  section {
    label = "Example Section"
    
    field {
      label = "username"
      value = "example_user"
      type  = "STRING"
    }
    
    field {
      label = "password"
      value = "example_password"
      type  = "CONCEALED"
    }
  }
}