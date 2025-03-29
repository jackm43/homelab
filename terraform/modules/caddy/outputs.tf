output "server_id" {
  description = "The ID of the created Caddy server"
  value       = caddy_server.main.id
}

output "routes_count" {
  description = "The number of routes configured"
  value       = length(caddy_server.main.routes)
}

output "domain" {
  description = "The main domain used for the server"
  value       = var.main_domain
}
