resource "google_compute_firewall" "ssh" {
  name    = "ssh-firewall"
  network = module.network.vpc_network_name


  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["managed-instance"]
}

