main_domain = "domain.me"
caddy_ip = "192.168.1.86"
pc_ip = "192.168.1.98"
proxmox_ip = "192.168.1.240"
nas_ip = "192.168.1.83"

services = {
  adguard = {
    subdomain = "adguard"
    simple_reverse_proxy = true
    is_pc = false
    ip = "192.168.1.83"
    port = 800
  },
}
