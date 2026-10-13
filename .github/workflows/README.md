# GitHub Actions Workflows

This directory is intended for CI/CD workflow definitions. Review the actual YAML files here before assuming a particular deployment path is active.

## Intended Pipeline

1. Run tests and static checks.
2. Build container images.
3. Publish images with immutable commit-based tags.
4. Update staging desired state through a reviewed Git change.
5. Let the GitOps controller reconcile staging.
6. Require explicit approval before production promotion.

This is an architecture goal, not a claim that current workflows implement every step.

## Security Review

- Set minimal workflow `permissions` and grant write access only to jobs that need it.
- Pin third-party actions to reviewed versions or commit SHAs.
- Store registry and cloud credentials in protected secrets; never print them in logs.
- Avoid long-lived Kubernetes credentials in CI when GitOps can reconcile desired state.
- Use concurrency controls to prevent conflicting deployments.
- Use immutable image tags instead of `latest`.
- Protect production with GitHub Environments, required reviewers, and branch protection where available.
- Avoid giving untrusted pull-request code access to write-capable secrets.
- Check that workflow triggers match intended branches and paths.

## Validation

Review workflow syntax, trigger conditions, permissions, secrets usage, image tags, and deployment behavior. Inspect run logs and test failure/rollback scenarios before relying on the pipeline.