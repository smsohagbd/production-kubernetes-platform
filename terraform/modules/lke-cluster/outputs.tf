output "cluster_id" {
  description = "ID of the Kubernetes cluster"
  value       = linode_lke_cluster.this.id
}

output "api_endpoints" {
  description = "Kubernetes API endpoints"
  value       = linode_lke_cluster.this.api_endpoints
}

output "kube_config" {
  description = "Kubernetes kubeconfig"
  value       = linode_lke_cluster.this.kubeconfig
  sensitive   = true
}