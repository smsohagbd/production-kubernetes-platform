# Platform Helm Chart

This directory contains the `platform` Helm chart and its default values.

## Inspect and Validate

From the repository root:

```bash
helm lint helm/platform
helm template platform helm/platform
```

Use the output to inspect rendered Kubernetes resources before deployment.

If environment-specific values files exist, render them explicitly:

```bash
helm template platform helm/platform -f <environment-values.yaml>
```

Replace the placeholder with a real file present in the repository.

## Configuration Review Points

The current default values have configuration sections for backend, frontend, and MySQL. Review these carefully before use:

- Ensure image repositories and tags point to intended images.
- Prefer immutable image tags and an appropriate pull policy.
- Confirm Service ports match application container ports.
- Confirm Ingress hosts, paths, TLS, ingress class, and controller availability.
- Do not place database passwords or credentials in plain values files.
- Verify the target cluster has the requested StorageClass.
- Review database persistence, backup, resource requests/limits, and upgrade behavior.
- Confirm probes and security contexts are defined in templates where required.

## Deployment Caution

A successful `helm lint` or `helm template` does not prove the application is production-ready. Test upgrades, rollbacks, persistence, and failure behavior in a non-production cluster first.