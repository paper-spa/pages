FROM containers.pkg.github.com/github/pages/pages-actions

# WORKDIR /github/workspace
CMD ["/usr/local/bundle/bin/jekyll", "build"]
