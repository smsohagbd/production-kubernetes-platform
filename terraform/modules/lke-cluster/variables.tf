variable "cluster_name" {
  description = "Name of the LKE cluster"
  type        = string
}

variable "region" {
  description = "Linode region for the LKE cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version for the LKE cluster"
  type        = string
}