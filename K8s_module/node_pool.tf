resource "google_container_node_pool" "worker_nodes" {
  name       = "my-node-pool"
  cluster    = google_container_cluster.private_gke.id
  initial_node_count = 1
  location = var.zone

  autoscaling {
    max_node_count = 1
    min_node_count = 1
  }
  max_pods_per_node = var.max_pods_per_node


  node_config {
    preemptible  = true
    machine_type = var.node_machine_type
    

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.gke_service_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}