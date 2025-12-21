provider "google" {
  zone    = var.zone
  region  = var.region
  project = var.project_id
}


module "storage" {
  source        = "./modules/storage"
  name          = "tf-bucket-210951"
  project_id    = var.project_id
  location      = "US"
  force_destroy = true

  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age        = 365
      with_state = "ANY"
    }
  }]


}

module "instances" {
  for_each = {
    "tf-instance-1" = {
      machine_type = "e2-micro"
    }
    "tf-instance-2" = {
      machine_type = "e2-micro"
    }
  }
  source       = "./modules/instances"
  name         = each.key
  machine_type = each.value.machine_type
  boot_disk    = each.value.boot_disk
}

/*
To import the instances from the console with
terraform import 'module.instances["tf-instance-1"].google_compute_instance.vm_instance' tf-instance-1
terraform import 'module.instances["tf-instance-2"].google_compute_instance.vm_instance' tf-instance-2
*/

terraform {
  backend "gcs" {
    bucket = "tf-bucket-210951"
    prefix = "terraform/state"
  }
}
