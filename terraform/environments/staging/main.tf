module "lke_cluster" {
  source = "../../modules/lke-cluster"

  cluster_name       = var.cluster_name
  region             = var.linode_region
  kubernetes_version = var.kubernetes_version

}