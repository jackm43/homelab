provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

module "cloudflare" {
  source = "../modules/cloudflare"
  
  cloudflare_api_token = var.cloudflare_api_token
  cloudflare_zone_id   = var.cloudflare_zone_id
  cloudflare_domain    = var.cloudflare_domain
} 