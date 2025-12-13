terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "3.5.0"
        }
    }
}

provider "google" {
  project = "qwiklabs-gcp-01-813e61639211"
  region = "europe-west1"
  zone = "europe-west1-c"
}

resource "google_compute_network" "vpc_network" {
    name = "terraform_network"
}

resource "google_compute_instance" "vm_instance" {
  name = "terraform-instance"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
        image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {}
  }
}