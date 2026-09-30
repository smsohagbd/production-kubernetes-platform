variable "linode_region" {
  description = "K8s region"
  type        = string
  default     = "us-east"
}

variable "cluster_name" {
  description = "k8s cluster name"
  type        = string
  default     = "production-platform-staging"
}

variable "kubernetes_version" {
  description = "Kubernetes version for the LKE cluster"
  type        = string
  default     = "1.35"
}