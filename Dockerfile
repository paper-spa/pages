FROM jekyll/jekyll:pages

ENV JEKYLL_DATA_DIR=/github/workspace
CMD ["/usr/jekyll/bin/entrypoint", "jekyll", "build"]
