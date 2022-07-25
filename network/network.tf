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
secondary_ip_range {
    range_name = "pods-range"
    ip_cidr_range = var.secondary_ip_range_restricted_1
}

secondary_ip_range  {
    range_name = "service-range"
    ip_cidr_range = var.secondary_ip_range_restricted_2
}
}