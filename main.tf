terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.33.0"
    }  
  }
}
  
provider "google" {}

resource "random_pet" "name" {}


resource "google_container_cluster" "gke" {
  name               = "gke-dev-${random_pet.name.id}"
  location           = var.location
  initial_node_count = var.node_count
}

variable "location" {}

Variable "node_count" {}


output "gke_cluster_id" {
    value = google_container_cluster.gke.id
}

output "gke_cluster_master_endpoint" {
    value = google_container_cluster.gke.endpoint
}
