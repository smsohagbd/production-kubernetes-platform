variable "linode_token" {
  description = "Linode API token"
  type        = string
  sensitive   = true
}

variable "linode_region" {
  description = "Linode region"
  type        = string
}

variable "instance_type" {
  description = "Linode instance type"
  type        = string
}

variable "instance_label" {
  description = "Linode instance label"
  type        = string
}

variable "master_node_type" {
  description = "master node type"
  type = string
}

variable "worker_node_type" {
  description = "worker_node_type"
  type = string
  
}
variable "servers" {
  type = map(string)

  default = {
    "master"  = "g6-standard-2"
    "worker1" = "g6-nanode-1"
    "worker2" = "g6-nanode-1"
    "worker3" = "g6-nanode-1"
  }
}

variable "ubuntu24" {
  description = "ubuntu 24.04"
  type = string
}