resource "google_container_registry" "registry" {
  project  = var.project
  location = "US"
}

resource "google_storage_bucket_iam_member" "viewer" {
  bucket = google_container_registry.registry.id
  role = "roles/storage.objectViewer"
  member = "serviceAccount:${module.gke.gke_serviceaccount}"
}