FROM ghcr.io/paper-spa/pages:main

ENV JEKYLL_DATA_DIR=/github/workspace
CMD ["/usr/jekyll/bin/entrypoint", "jekyll", "build"]
