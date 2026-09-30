terraform {
  required_providers {
    linode = {
      source = "linode/linode"
    }
  }
}

resource "linode_lke_cluster" "this" {
  label       = var.cluster_name
  region      = var.region
  k8s_version = var.kubernetes_version

  pool {
    type  = "g6-standard-2"
    count = 1
  }
}