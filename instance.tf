resource "google_service_account" "manager_service_account" {
  account_id   = "manager-account"
  display_name = "manager_service_account"
}

resource "google_compute_instance" "manager-instance" {
  name         = "manager-instance"
  machine_type = "n1-standard-1"
  zone         = "${var.region}-a"

  tags = ["managed-instance"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = google_compute_subnetwork.management-subnetwork.name

    
  }

  
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.manager_service_account.email
    scopes = ["cloud-platform"]
  }
}