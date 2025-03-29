variable "main_domain" {
  type = string
  description = "The main domain to create Caddy resources for"
}

variable "proxmox_ip" {
  type = string
  description = "The IP address of the Proxmox server"
}

variable "nas_ip" {
  type = string
  description = "The IP address of the NAS server"
}

variable "caddy_ip" {
  type = string
  description = "The IP address of the Caddy server"
}

variable "services" {
  type = map(object({
    subdomain = string
    simple_reverse_proxy = bool
    is_pc = bool
    ip = string
    port = number
  }))
  default = {}
  description = "The services to create Caddy resources for"
}