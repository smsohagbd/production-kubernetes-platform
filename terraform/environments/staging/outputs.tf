output "cluster_id" {
  description = "ID of the staging LKE cluster"
  value       = module.lke_cluster.cluster_id
}

output "api_endpoints" {
  description = "Kubernetes API endpoints for the staging cluster"
  value       = module.lke_cluster.api_endpoints
}

output "kube_config" {
  description = "Kubeconfig for the staging LKE cluster"
  value       = module.lke_cluster.kube_config
  sensitive   = true
}