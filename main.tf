module "network" {
  source = "./network"
  project = var.project
  region  = var.region
}

module "iam" {
  source = "./iam"
  project = var.project
}

module "gke" {
  source = "./gke"
  project   = var.project
  region    = var.region
  zone      = var.zone
  cluster_name = var.cluster_name
  network    = module.network.vpc_id
  subnet1 = module.network.subnet1_id
  node_sa    = module.iam.node_sa_email
}
