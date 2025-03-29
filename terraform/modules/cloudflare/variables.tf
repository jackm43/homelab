variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token for authentication"
  sensitive   = true
}

variable "cloudflare_zone_id" {
  type        = string
  description = "The zone ID for the Cloudflare domain"
}

variable "cloudflare_domain" {
  type        = string
  description = "The domain name managed by Cloudflare"
}

variable "dns_records" {
  type = map(object({
    name    = string
    value   = string
    type    = string
    proxied = optional(bool, true)
    ttl     = optional(number, 1)
  }))
  description = "Map of DNS records to manage in Cloudflare"
  default     = {}
}
