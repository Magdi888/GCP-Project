resource "google_service_account" "manager_service_account" {
  account_id   = "manager-account"
  display_name = "manager_service_account"
}



resource "google_project_iam_member" "k8s_admin_role" {
  project = var.project
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.manager_service_account.email}"
}