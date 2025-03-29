provider "onepassword" {
  service_account_token = var.onepassword_service_account_token
}

module "onepassword" {
  source = "../modules/onepassword"
  
  create_example_vault = var.onepassword_create_example_vault
  create_example_item  = var.onepassword_create_example_item
  default_vault_id     = var.onepassword_default_vault_id
  
  vaults = var.onepassword_vaults
  items  = var.onepassword_items
  
  service_account_token = var.onepassword_service_account_token
  op_account           = var.onepassword_account
  token                = var.onepassword_token
  connect_url          = var.onepassword_connect_url
}