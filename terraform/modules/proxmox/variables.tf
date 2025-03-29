variable "virtual_environment_endpoint" {
  type        = string
  description = "The Proxmox API endpoint URL"
}

variable "virtual_environment_username" {
  type        = string
  description = "Proxmox username for authentication"
  default     = null
}

variable "virtual_environment_password" {
  type        = string
  description = "Proxmox password for authentication"
  default     = null
  sensitive   = true
}

variable "virtual_environment_api_token" {
  type        = string
  description = "Proxmox API token for authentication"
  default     = null
  sensitive   = true
}

variable "virtual_environment_auth_ticket" {
  type        = string
  description = "Proxmox authentication ticket"
  default     = null
  sensitive   = true
}

variable "virtual_environment_csrf_prevention_token" {
  type        = string
  description = "Proxmox CSRF prevention token"
  default     = null
  sensitive   = true
}
