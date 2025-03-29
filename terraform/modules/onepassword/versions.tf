terraform {
  required_version = ">= 1.0.0"
  
  required_providers {
    onepassword = {
      source  = "1password/onepassword"
      version = "2.1.2"
    }
  }
} 