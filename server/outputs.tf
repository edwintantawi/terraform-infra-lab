output "external_urls" {
  description = "Server external URLs"
  value       = google_compute_instance.web_server.network_interface[*].access_config[0].nat_ip
}
