
resource "google_compute_network" "web_server" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "web_server" {
  name          = var.subnetwork_name
  network       = google_compute_network.web_server.self_link
  region        = "us-central1"
  ip_cidr_range = "10.0.0.0/29"
}

resource "google_compute_firewall" "web_server_allow_ssh" {
  name          = "${var.network_name}-allow-ssh"
  network       = google_compute_network.web_server.self_link
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "web_server_allow_http" {
  name          = "${var.network_name}-allow-http"
  network       = google_compute_network.web_server.self_link
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}
