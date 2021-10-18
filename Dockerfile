FROM docker.io/jekyll/jekyll:pages@sha256:a32d1b764df3871421d2cdc3fa8920c31f460f731f15dbd64ff002e5d949c61c

ENV JEKYLL_DATA_DIR=/github/workspace
CMD ["/usr/jekyll/bin/entrypoint", "jekyll", "build"]
