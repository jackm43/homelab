terraform {
  required_version = ">= 1.0.0"
  
  required_providers {
    caddy = {
      source  = "conradludgate/caddy"
      version = "~> 0.1.0"
    }
    
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.73.1"
    }
    
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
    
    onepassword = {
      source = "1Password/onepassword"
      version = "2.1.2"
    }
  }
} 
