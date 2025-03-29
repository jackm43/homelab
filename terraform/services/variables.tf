variable "main_domain" {
  type        = string
  description = "The main domain to create Caddy resources for"
}

variable "caddy_ip" {
  type        = string
  description = "The IP address of the Caddy server"
}

variable "proxmox_ip" {
  type        = string
  description = "The IP address of the Proxmox server"
}

variable "nas_ip" {
  type        = string
  description = "The IP address of the NAS server"
}

variable "pc_ip" {
  type        = string
  description = "The IP address of the PC server"
}

variable "services" {
  type = map(object({
    subdomain           = string
    simple_reverse_proxy = bool
    is_pc               = bool
    ip                  = string
    port                = number
  }))
  description = "The services to create Caddy resources for"
}

variable "proxmox_endpoint" {
  type        = string
  description = "The Proxmox API endpoint URL"
  default     = null
}

variable "proxmox_api_token" {
  type        = string
  description = "Proxmox API token"
  default     = null
  sensitive   = true
}

variable "proxmox_username" {
  type        = string
  description = "Proxmox username"
  default     = null
}

variable "proxmox_password" {
  type        = string
  description = "Proxmox password"
  default     = null
  sensitive   = true
}

variable "proxmox_auth_ticket" {
  type        = string
  description = "Proxmox authentication ticket"
  default     = null
  sensitive   = true
}

variable "proxmox_csrf_prevention_token" {
  type        = string
  description = "Proxmox CSRF prevention token"
  default     = null
  sensitive   = true
}

# Cloudflare variables
variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token"
  default     = null
  sensitive   = true
}

variable "cloudflare_zone_id" {
  type        = string
  description = "The Cloudflare zone ID"
  default     = ""
}

variable "cloudflare_domain" {
  type        = string
  description = "The domain name for Cloudflare"
  default     = ""
}

# OnePassword variables
variable "onepassword_service_account_token" {
  type        = string
  description = "1Password service account token"
  default     = null
  sensitive   = true
}

variable "onepassword_token" {
  type        = string
  description = "1Password connect token"
  default     = null
  sensitive   = true
}

variable "onepassword_account" {
  type        = string
  description = "1Password account identifier"
  default     = null
}

variable "onepassword_connect_url" {
  type        = string
  description = "1Password connect URL"
  default     = null
}

variable "onepassword_create_example_vault" {
  type        = bool
  description = "Whether to create an example vault"
  default     = false
}

variable "onepassword_create_example_item" {
  type        = bool
  description = "Whether to create an example item"
  default     = false
}

variable "onepassword_default_vault_id" {
  type        = string
  description = "Default vault ID to use for items"
  default     = ""
}

variable "onepassword_vaults" {
  type = map(object({
    uuid = string
    name = string
  }))
  description = "Map of vault configurations for OnePassword"
  default     = {}
}

variable "onepassword_items" {
  type = map(object({
    title    = string
    vault    = string
    category = optional(string)
    tags     = optional(list(string))
  }))
  description = "Map of items to manage in OnePassword"
  default     = {}
}