output "worker1_ip" {
  value = tolist(linode_instance.staging["worker1-staging"].ipv4)[0]
}