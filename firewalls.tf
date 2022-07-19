resource "google_compute_firewall" "ssh" {
  name    = "ssh-firewall"
  network = google_compute_network.vpc_network.name


  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["managed-instance"]
}

resource "google_compute_firewall" "restricted_subnet_firewall" {
  name    = "restricted-subnet-firewall"
  network = google_compute_network.vpc_network.name


  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [google_compute_subnetwork.management-subnetwork.ip_cidr_range]
}