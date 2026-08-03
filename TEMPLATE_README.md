# Deploy and Host immudb on Railway

## About Hosting immudb

immudb is an append-only database with cryptographic verification, SQL, key-value, and document APIs. This template runs stable 1.11.1 with a generated administrator password and durable storage.

Authenticate as `immudb` with `IMMUDB_ADMIN_PASSWORD`.

## Common Use Cases

- Tamper-evident audit records
- Verifiable key-value and SQL data
- Application integrity logs

## Dependencies for immudb Hosting

One immudb service uses a daily-backed-up volume. The HTTPS domain exposes the HTTP API and web console; gRPC remains project-private.

## Implementation Details

Health uses `/api/v2/health`; data persists at `/data/immudb`. This is a one-replica topology. Immutability does not replace access control, backups, or retention planning.

## Why Deploy immudb on Railway?

Railway provides generated credentials, HTTPS, persistent storage, backups, health checks, and Git-driven updates.
