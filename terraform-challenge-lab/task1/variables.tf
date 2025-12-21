variable "zone" {
  type        = string
  description = "Root zone for all the resources"
  default = "us-east1-c"
}

variable "region" {
  type        = string
  description = "Root region for all the resources"
  default = "us-east1"
}

variable "project_id" {
  type        = string
  description = "Lab project ID"
  default = "qwiklabs-gcp-04-af7a12f07519"
}
