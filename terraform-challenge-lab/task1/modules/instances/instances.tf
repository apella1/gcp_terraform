resource "google_compute_instance" "vm_instance" {
  name                      = var.name
  machine_type              = var.machine_type
  allow_stopping_for_update = true
  metadata_startup_script   = <<-EOT
        #!/bin/bash
    EOT

  boot_disk {
    initialize_params {
      image = var.boot_disk
    }

  }

  network_interface {
    network    = var.network
    subnetwork = var.subnet
    access_config {
    }
  }

}
