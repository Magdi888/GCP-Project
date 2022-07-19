provider "google" {
  project     = var.project
  credentials = file("/home/ahmed/.config/gcloud/application_default_credentials.json")
  region      = var.region
  zone        = var.zone
}