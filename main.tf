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
  location           = "europe-west2-a"
  initial_node_count = 1
}



output "gke_cluster_id" {
    value = google_container_cluster.gke.id
}

output "gke_cluster_master_endpoint" {
    value = google_container_cluster.gke.endpoint
}
