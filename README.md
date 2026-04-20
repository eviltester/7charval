7charval
========

A simple exploratory testing exercise

When I release this to the web I usually only release the html file and the obfuscated javascript.

I sometimes upload and amend the .htaccess file to ensure that the users can't access the folder structure.

When written it didn't work on IE but did on Firefox to create a cross browser defect as well as the defects coded into the script.

Documentation
=============

See the docs index: [docs/README.md](docs/README.md)

Generate Kroki Example Images
=============================

Use the PowerShell script to generate images from diagram source files via the Kroki API:

```powershell
.\scripts\generate-kroki-png.ps1
```

Bash equivalent:

```bash
./scripts/generate-kroki-png.sh
```

By default it recursively processes files in `docs/examples`.

Supported source extensions:

- `.dot` (Graphviz)
- `.d2` (D2, output is `.svg` because Kroki D2 supports SVG)
- `.c4` (C4 PlantUML syntax only)
- `.mmd` (Mermaid)
- `.dsl` (Structurizr)

Note: `.c4` files using LikeC4 DSL are skipped because Kroki does not support LikeC4 syntax.

To use a different source root:

```powershell
.\scripts\generate-kroki-png.ps1 -InputRoot "docs/examples/kroki"
```

```bash
./scripts/generate-kroki-png.sh --input-root "docs/examples/kroki"
```

Generate Graphviz PNGs from all `.dot` files in `docs` recursively:

```powershell
.\scripts\generate-graphviz-png.ps1
```

```bash
./scripts/generate-graphviz-png.sh
```
