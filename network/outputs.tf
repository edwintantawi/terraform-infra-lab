output "network_name" {
  description = "VPC network Name"
  value       = google_compute_network.web_server.name
}

output "subnet_name" {
  description = "VPC subnetwork Name"
  value       = google_compute_subnetwork.web_server.name
}
