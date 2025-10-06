## Getting dependencies

This chart declares Bitnami PostgreSQL as a dependency when `postgresql.enabled=true`.

Fetch/build chart dependencies (downloads the PostgreSQL chart tarball into `charts/`):

```bash
helm dependency update .
# or
helm dependency build .
```

## Using legacy PostgreSQL image

We override the Bitnami chart image to use `bitnamilegacy/postgresql` via `values.yaml`:

```yaml
postgresql:
  enabled: true
  image:
    repository: bitnamilegacy/postgresql
```

Adjust `image.tag` as needed (e.g., `16`).