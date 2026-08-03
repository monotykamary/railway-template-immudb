FROM docker.io/codenotary/immudb:1.11.1@sha256:05917458fd8fdfab613bd7ea030af8a9d20b97c35671e57b4ca24b4c64545e39 AS upstream
FROM docker.io/library/debian:bookworm-slim@sha256:63a496b5d3b99214b39f5ed70eb71a61e590a77979c79cbee4faf991f8c0783e
RUN groupadd --gid 3322 immu && useradd --uid 3322 --gid 3322 --home-dir /usr/share/immudb --create-home immu && mkdir -p /var/lib/immudb
COPY --from=upstream /usr/sbin/immudb /usr/sbin/immudb
COPY --from=upstream /usr/local/bin/immuadmin /usr/local/bin/immuadmin
COPY --from=upstream /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY entrypoint.sh /usr/local/bin/immudb-railway-entrypoint
RUN chmod +x /usr/local/bin/immudb-railway-entrypoint
ENV IMMUDB_DIR=/data/immudb IMMUDB_ADDRESS=0.0.0.0 IMMUDB_PORT=3322 IMMUDB_AUTH=true IMMUDB_PGSQL_SERVER=true HOME=/usr/share/immudb
EXPOSE 8080 3322
ENTRYPOINT ["/usr/local/bin/immudb-railway-entrypoint"]
CMD ["--web-server"]
