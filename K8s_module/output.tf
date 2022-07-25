output "gke_serviceaccount" {
    value = google_service_account.gke_service_account.email
}

output "private_gke" {
    value = google_container_cluster.private_gke
}

output "nodepool" {
    value = google_container_node_pool.worker_nodes
}