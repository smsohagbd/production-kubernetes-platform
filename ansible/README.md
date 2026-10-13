# Ansible

This directory is intended for host preparation and configuration automation.

## Inventory Safety

Inspect the actual inventory and playbook filenames before running commands. Do not commit private keys, passwords, access tokens, or sensitive host data.

```bash
ansible-inventory -i <inventory-file> --graph
ansible-playbook -i <inventory-file> <playbook.yml> --syntax-check
```

Replace placeholders with files that actually exist under `ansible/`.

## Safe Execution

Where supported, preview changes with check mode:

```bash
ansible-playbook -i <inventory-file> <playbook.yml> --check --diff
```

Review output before executing against real servers. Some modules do not fully support check mode, so it is not a substitute for understanding the playbook.

## Kubernetes Node Preparation

Previous lab work included preparing Linux hosts for Kubernetes networking by loading kernel modules and setting sysctl values such as IP forwarding and bridge netfilter settings.

Verify the current playbooks before assuming these tasks remain present or are suitable for a new OS or kernel version.

## Production Hardening Checklist

- [ ] Use SSH keys and least-privilege accounts.
- [ ] Store secrets in Ansible Vault or an approved secret manager.
- [ ] Avoid embedding sensitive host details in public inventory.
- [ ] Make tasks idempotent.
- [ ] Use handlers where appropriate.
- [ ] Validate supported OS versions and package sources.
- [ ] Test against disposable hosts before production.