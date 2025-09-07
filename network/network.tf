
resource "google_compute_network" "vpc_network" {
  name                    = "terry-gke-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet1" {
  name          = "terry-gke-subnet-1"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet2" {
  name          = "terry-gke-subnet-2"
  ip_cidr_range = "10.0.2.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.id
}


output "vpc_id" {
  value = google_compute_network.vpc_network.id
}

output "subnet1_id" {
  value = google_compute_subnetwork.subnet1.id
}

output "subnet2_id" {
  value = google_compute_subnetwork.subnet2.id
}
