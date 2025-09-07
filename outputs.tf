output "cluster_endpoint" {
  value = module.gke.cluster_endpoint
}

output "kubeconfig" {
  value = module.gke.kubeconfig
}
