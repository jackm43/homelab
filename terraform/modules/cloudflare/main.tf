resource "cloudflare_dns_record" "example" {
  count   = var.cloudflare_zone_id != "" && var.cloudflare_domain != "" ? 1 : 0
  zone_id = var.cloudflare_zone_id
  name    = "example"
  content = "192.0.2.1"
  type    = "A"
  ttl     = 3600
}