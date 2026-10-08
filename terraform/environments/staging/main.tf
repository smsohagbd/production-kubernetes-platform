module "lke_cluster" {
  source = "../../modules/lke-cluster"

  cluster_name       = var.cluster_name
  region             = var.linode_region
  kubernetes_version = var.kubernetes_version

}

module "node_pool" {
  source = "../../modules/node-pool"

  cluster_id     = module.lke_cluster.cluster_id
  node_type      = "g6-standard-2"
  node_count     = 2
  autoscaler_min = 1
  autoscaler_max = 3
}

resource "local_file" "kubeconfig" {
  content  = base64decode(module.lke_cluster.kube_config)
  filename = "${path.module}/kubeconfig"
}