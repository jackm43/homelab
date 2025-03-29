output "domain" {
  description = "The domain name used for Cloudflare records"
  value       = var.cloudflare_domain
}

output "zone_id" {
  description = "The Cloudflare zone ID"
  value       = var.cloudflare_zone_id
}

output "example_record_name" {
  description = "The example DNS record name"
  value       = length(cloudflare_dns_record.example) > 0 ? cloudflare_dns_record.example[0].name : null
}

output "example_record_value" {
  description = "The example DNS record value"
  value       = length(cloudflare_dns_record.example) > 0 ? cloudflare_dns_record.example[0].content : null
}
