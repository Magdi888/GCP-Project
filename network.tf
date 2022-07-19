resource "google_compute_network" "vpc_network" {
name = "terraform-network"
auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "management-subnetwork" {
name = "management-subnetwork"
ip_cidr_range = var.subnet1_cidr
region = var.region
network = google_compute_network.vpc_network.name
}

resource "google_compute_subnetwork" "restricted-subnetwork" {
name = "restricted-subnetwork"
ip_cidr_range = var.subnet2_cidr
region = var.region
network = google_compute_network.vpc_network.name
}