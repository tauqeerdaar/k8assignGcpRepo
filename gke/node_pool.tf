
resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.zone
  node_count = 2

  node_config {
    machine_type   = "e2-micro"
    service_account = var.node_sa
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  depends_on = [google_container_cluster.primary]
}
