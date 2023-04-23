resource "google_compute_instance" "web_server" {
  name         = var.instance_name
  description  = "http web server"
  zone         = "us-central1-c"
  machine_type = "e2-micro"
  tags         = ["http-web-server"]

  boot_disk {
    auto_delete = true
    device_name = "tf-web-server-boot-disk"

    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 10
      type  = "pd-balanced"
    }
  }

  network_interface {
    network    = var.network_name
    subnetwork = var.subnetwork_name
    access_config {}
  }

  metadata_startup_script = <<EOF
    #! /bin/bash
    apt-get update
    apt-get install apache2 -y
    a2ensite default-ssl
    a2enmod ssl
    vm_hostname="$(curl -H "Metadata-Flavor:Google" \
    http://metadata.google.internal/computeMetadata/v1/instance/name)"
    echo "Page served from: $vm_hostname" | \
    tee /var/www/html/index.html
    systemctl restart apache2
  EOF
}
