provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  count      = length(var.subnet_cidrs)
  name       = "${var.vpc_name}-subnet-${count.index}"
  ip_cidr_range = var.subnet_cidrs[count.index]
  region     = var.region
  network    = google_compute_network.vpc_network.id
}

resource "google_cloud_run_service" "service" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.service_image
        resources {
          limits = {
            memory = var.service_memory
          }
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}


