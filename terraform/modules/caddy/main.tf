variable "caddy_ip" {
  type        = string
  description = "The IP address of the Caddy server"
}

variable "main_domain" {
  type        = string
  description = "The main domain to create Caddy resources for"
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

# Create a server resource with all routes
resource "caddy_server" "main" {
  listen = [":443"]
  
  # Create routes for simple services
  dynamic "routes" {
    for_each = {
      for k, v in var.services : k => v if v.simple_reverse_proxy
    }
    
    content {
      match = [{
        host = ["${routes.value.subdomain}.${var.main_domain}"]
      }]
      
      handle = [{
        handler = "reverse_proxy"
        upstreams = [{
          dial = "${routes.value.ip}:${routes.value.port}"
        }]
      }]
    }
  }
  
  # Create route for proxmox if it exists
  dynamic "routes" {
    for_each = contains([for k, v in var.services : k], "proxmox") ? [1] : []
    
    content {
      match = [{
        host = ["proxmox.${var.main_domain}"]
      }]
      
      handle = [{
        handler = "reverse_proxy"
        upstreams = [{
          dial = "${var.services["proxmox"].ip}:${var.services["proxmox"].port}"
        }]
        transport = {
          protocol = "http"
          tls = {
            insecure_skip_verify = true
          }
        }
      }]
    }
  }
  
  # Create route for proxmox websockets if it exists
  dynamic "routes" {
    for_each = contains([for k, v in var.services : k], "proxmox") ? [1] : []
    
    content {
      match = [{
        host = ["proxmox.${var.main_domain}"]
        headers = {
          "Connection" = ["*Upgrade*"]
          "Upgrade" = ["websocket"]
        }
      }]
      
      handle = [{
        handler = "reverse_proxy"
        upstreams = [{
          dial = "${var.services["proxmox"].ip}:${var.services["proxmox"].port}"
        }]
        transport = {
          protocol = "http"
          tls = {
            insecure_skip_verify = true
          }
        }
      }]
    }
  }
  
  # Create route for UDM if it exists
  dynamic "routes" {
    for_each = contains([for k, v in var.services : k], "udm") ? [1] : []
    
    content {
      match = [{
        host = ["udm.${var.main_domain}"]
      }]
      
      handle = [{
        handler = "reverse_proxy"
        upstreams = [{
          dial = "${var.services["udm"].ip}:${var.services["udm"].port}"
        }]
        transport = {
          protocol = "http"
          tls = {
            insecure_skip_verify = true
          }
        }
      }]
    }
  }
  
  # Create route for cumdump if it exists
  dynamic "routes" {
    for_each = contains([for k, v in var.services : k], "cumdump") ? [1] : []
    
    content {
      match = [{
        host = ["cumdump.${var.main_domain}"]
      }]
      
      handle = [{
        handler = "reverse_proxy"
        upstreams = [{
          dial = "${var.services["cumdump"].ip}:${var.services["cumdump"].port}"
        }]
        transport = {
          protocol = "http"
          tls = {
            insecure_skip_verify = true
          }
        }
      }]
    }
  }
  
  # Create route for cumdump websockets if it exists
  dynamic "routes" {
    for_each = contains([for k, v in var.services : k], "cumdump") ? [1] : []
    
    content {
      match = [{
        host = ["cumdump.${var.main_domain}"]
        headers = {
          "Connection" = ["*Upgrade*"]
          "Upgrade" = ["websocket"]
        }
      }]
      
      handle = [{
        handler = "reverse_proxy"
        upstreams = [{
          dial = "${var.services["cumdump"].ip}:${var.services["cumdump"].port}"
        }]
        transport = {
          protocol = "http"
          tls = {
            insecure_skip_verify = true
          }
        }
      }]
    }
  }
  
  # Create route for search if it exists
  dynamic "routes" {
    for_each = contains([for k, v in var.services : k], "search") ? [1] : []
    
    content {
      match = [{
        host = ["search.${var.main_domain}"]
      }]
      
      handle = [{
        handler = "reverse_proxy"
        upstreams = [{
          dial = "${var.services["search"].ip}:${var.services["search"].port}"
        }]
        timeouts = {
          read_body = "1m"
          read_header = "10s"
          write = "2m"
          idle = "5m"
          response = "5m"
        }
      }]
    }
  }
}