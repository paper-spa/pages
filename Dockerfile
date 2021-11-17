FROM ghcr.io/github/pages-gem:v222

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

