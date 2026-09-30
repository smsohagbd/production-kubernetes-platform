resource "linode_instance" "staging" {
  for_each = local.staging
  label = each.key
  type = each.value
  image = var.ubuntu24
  region = var.linode_region
  authorized_keys = [
    chomp(file("~/.ssh/id_ed25519.pub"))
  ]

}