provider "google" {
  project = "qwiklabs-gcp-03-1c8d1724bd39"
  region  = "us-west1"
}

resource "google_storage_bucket" "test-bucket-for-state" {
  name                        = "qwiklabs-gcp-03-1c8d1724bd39"
  location                    = "US"
  uniform_bucket_level_access = true
}

// local backend
terraform {
  backend "local" {
    path = "terraform/state/terraform.tfstate"
  }
}

// cloud backend
terraform {
  backend "gcs" {
    bucket  = "qwiklabs-gcp-03-1c8d1724bd39"
    prefix  = "terraform/state"
  }
}
