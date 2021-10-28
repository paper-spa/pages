# pages-jekyll
A simple GitHub Action for producing Jekyll build artifacts compatible with GitHub Pages

# Usage

## Build with Pages-gem and deploy to GitHub Pages

```yaml
jobs:
  build-pages:
    runs-on: ubuntu-latest
    name: Build Pages with Jekyll
    steps:
      - name: Build page with Jekyll
        uses: actions/pages-jekyll@v4
        with:
          source: ./source_dir
          destination: ./source_dir/_site
  deploy-to-pages:
    runs-on: ubuntu-latest
    name: Deploy to Pages
    steps:
      - name: Upload artifact
        uses: actions/upload-artifact@main
        with:
          name: github-pages
          path: ./dist
      - name: Deploy artifact
        uses: actions/deploy-pages@main
        with:
          artifact-name: github-pages
```

