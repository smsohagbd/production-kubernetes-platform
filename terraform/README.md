# Terraform

This directory contains infrastructure-as-code environments and reusable modules.

## Layout

- `environments/staging/`: staging root configuration.
- `environments/production/`: reserved for production configuration; verify completeness before use.
- `modules/`: reusable infrastructure modules such as LKE cluster, node pool, and firewall components.

## Current Lab Context

The staging configuration has previously used the `linode/linode` provider and LKE resources. Treat it as a lab configuration, not a guarantee that the cluster still exists.

Future AWS Terraform work should be implemented and validated separately rather than silently reusing Linode-specific resources.

## Safe Workflow

Run from the environment directory:

```bash
cd terraform/environments/staging
terraform init
terraform fmt -check -recursive
terraform validate
terraform plan
```

Review the plan before applying. Verify the account, region, cluster version, and expected resource count. Cloud resources may incur charges.

## State and Credentials

- Do not commit `terraform.tfstate`, backups, or `.terraform/`.
- Do not commit real `.tfvars` files or provider tokens.
- Track `.terraform.lock.hcl` to preserve provider selections.
- Use remote state with access controls and locking for shared environments.
- `sensitive = true` hides display output; it does not encrypt state.
- The staging configuration writes a local `kubeconfig` file. Keep it out of Git, restrict filesystem permissions, and rotate credentials if exposed.

## Before Production Use

- [ ] Confirm provider and Kubernetes version compatibility.
- [ ] Add remote state and locking.
- [ ] Review IAM and credential handling.
- [ ] Review network and firewall exposure.
- [ ] Review node sizing, autoscaling, and availability.
- [ ] Confirm backups, monitoring, and cost controls.
- [ ] Validate plan output before every apply or destroy.