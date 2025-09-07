# Cluster Service Account
resource "google_service_account" "gke_cluster_sa" {
  account_id   = "gke-cluster-sa"
  display_name = "GKE Cluster Service Account"
}

# Node Service Account
resource "google_service_account" "gke_node_sa" {
  account_id   = "gke-node-sa"
  display_name = "GKE Node Service Account"
}

# Bind Roles to Node Service Account
resource "google_project_iam_member" "node_sa_roles" {
  for_each = toset([
    "roles/container.nodeServiceAccount",
    "roles/compute.instanceAdmin.v1",
    "roles/iam.serviceAccountUser"
  ])
  project = var.project
  role    = each.value
  member  = "serviceAccount:${google_service_account.gke_node_sa.email}"
}


output "node_sa_email" {
  value = google_service_account.gke_node_sa.email
}
