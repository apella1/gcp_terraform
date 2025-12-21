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

module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "10.0.0"

  project_id   = var.project_id
  network_name = "tf-vpc-381802"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-east1"
    },
    {
      subnet_name   = "subnet-02"
      subnet_ip     = "10.10.20.0/24"
      subnet_region = "us-east1"
    },
  ]

}

terraform {
  backend "gcs" {
    bucket = "tf-bucket-210951"
    prefix = "terraform/state"
  }
}
