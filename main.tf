module "web_server_network" {
  source          = "./network"
  network_name    = "web-net"
  network_region  = var.project_region
  subnetwork_name = "web-subnet"
}

module "web_server" {
  for_each        = toset(["dev-server", "prod-server"])
  source          = "./server"
  instance_name   = "tf-${each.key}"
  instance_zone   = var.project_zone
  network_name    = module.web_server_network.network_name
  subnetwork_name = module.web_server_network.subnet_name
}
