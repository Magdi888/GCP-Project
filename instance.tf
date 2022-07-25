resource "google_compute_instance" "manager-instance" {
  name         = "manager-instance"
  machine_type = var.machine_type
  zone         = "${var.region}-a"

  tags = ["managed-instance"]

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    subnetwork =  module.network.restricted_subnet_name

    
  }

  
  service_account {
    email  = google_service_account.manager_service_account.email
    scopes = ["cloud-platform"]
  }
  depends_on = [module.network.managed_subnet, module.gke.private_gke, module.gke.nodepool]

  metadata_startup_script = file("./config_gcloud.sh")

  

}