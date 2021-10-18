# pages
A simple GitHub Action for producing Jekyll build artifacts compatible with GitHub Pages

# Usage

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    name: Build Pages with Jekyll
    steps:
      - name: Build with Jekyll
        uses: actions/pages@main
      - name: Upload Artifact
        uses: actions/upload-artifact@main
        with:
          path: ./_site
```
