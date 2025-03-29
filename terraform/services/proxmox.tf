provider "proxmox" {
  endpoint = var.proxmox_endpoint

  api_token = var.proxmox_api_token
  username  = var.proxmox_username
  password  = var.proxmox_password
  auth_ticket           = var.proxmox_auth_ticket
  csrf_prevention_token = var.proxmox_csrf_prevention_token
}

module "proxmox" {
  source = "../modules/proxmox"
  
  virtual_environment_endpoint           = var.proxmox_endpoint
  virtual_environment_api_token          = var.proxmox_api_token
  virtual_environment_username           = var.proxmox_username
  virtual_environment_password           = var.proxmox_password
  virtual_environment_auth_ticket        = var.proxmox_auth_ticket
  virtual_environment_csrf_prevention_token = var.proxmox_csrf_prevention_token
} 