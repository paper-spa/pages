# TODO: Replace this with (when available)
# FROM ghcr.io/github/pages-gem:latest
FROM ghcr.io/jriggins/pages-gem:latest

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

