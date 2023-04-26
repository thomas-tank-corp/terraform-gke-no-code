terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.33.0"
    }
    
  cloud {
    organization = "tom-se-hashi"
    workspaces {
      tags = ["gcp"]
    }
}


provider "google" {}


resource "google_container_cluster" "gke" {
  name               = var.gke_cluster_name
  location           = "europe-west2-a"
  initial_node_count = 1
}

variable "gke_cluster_name" {}


output "gke_cluster_id" {
    value = google_container_cluster.gke.id
}

output "gke_cluster_master_endpoint" {
    value = google_container_cluster.gke.endpoint
}
