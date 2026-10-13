# Kubernetes Manifests

This directory is intended for Kubernetes manifests and environment-specific configuration. Inspect the actual directory structure before applying resources; filenames and overlays can differ between project stages.

## Before Applying

```bash
kubectl config current-context
kubectl get nodes
kubectl get namespaces
```

Confirm the context and namespace are correct. Validate manifests using the tooling available in your workflow, and review generated resources before applying them.

## Operational Review Checklist

- [ ] Workloads have appropriate resource requests and limits.
- [ ] Readiness, liveness, and startup probes are appropriate.
- [ ] Configuration is separated from credentials.
- [ ] Secrets are not stored as plaintext in Git.
- [ ] Services select intended Pods and expose intended ports.
- [ ] Ingress hosts, paths, TLS, and controller configuration are correct.
- [ ] NetworkPolicies are tested against actual traffic requirements.
- [ ] Stateful workloads have persistent storage and backup/restore procedures.
- [ ] Pod security settings and service-account permissions follow least privilege.
- [ ] Rollout and rollback behavior has been tested.

A manifest applying successfully does not prove production readiness. Verify runtime behavior, logs, events, probes, storage, and network reachability.