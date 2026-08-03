# immudb on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/immudb?referralCode=ZqgrJ0)

Deploy immudb 1.11.1 with a generated admin password and daily-backed-up immutable storage. The verified deploy button is added after publication.

Use username `immudb` and `IMMUDB_ADMIN_PASSWORD`. The public domain exposes the HTTP API and console on port 8080; native gRPC on 3322 stays private. Data persists at `/data/immudb`. Use one replica unless you deliberately configure upstream replication.

Upstream: https://github.com/codenotary/immudb/tree/v1.11.1 (Apache-2.0). immudb is not affiliated with Railway.
