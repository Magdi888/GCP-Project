resource "google_service_account" "gke_service_account" {
  account_id   = "gke-account"
  display_name = "gke_service_account"
}


## role to can pull images from GCR
resource "google_project_iam_member" "k8s_roles" {
  project = var.project
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}