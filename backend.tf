terraform {
  backend "gcs" {
    bucket  = "backendstate"
    prefix  = "terraform/state"
  }
}