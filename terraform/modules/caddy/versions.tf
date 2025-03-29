terraform {
  required_version = ">= 1.0.0"
  
  required_providers {
    caddy = {
      source  = "conradludgate/caddy"
      version = "~> 0.1.0"
    }
  }
} 