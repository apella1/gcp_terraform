provider "google" {
  zone    = var.zone
  region  = var.region
  project = var.project_id
}


module "storage" {
  source = "./modules/storage"
}

module "instances" {
  for_each = toset(["tf-instance-1", "tf-instance-2"])
  source   = "./modules/instances"
  name     = each.key
}

/*
To import the instances from the console with
terraform import 'module.instances["tf-instance-1"].google_compute_instance.vm_instance' tf-instance-1
terraform import 'module.instances["tf-instance-2"].google_compute_instance.vm_instance' tf-instance-2
*/