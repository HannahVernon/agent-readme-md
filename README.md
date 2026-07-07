# agent-readme.md

[![agent-readme](https://agent-readme.md/badge.svg)](./agent-readme.md)

The website and reference for the **AGENT-README.md** convention: a single Markdown file that tells AI agents how to work in a project.  Live at `https://agent-readme.md`.

`README.md` is for humans.  `AGENT-README.md` is for the machines that now read your code.

## What's here

This is a dependency-free static site: hand-authored HTML, one CSS file, and Markdown.  There is no build step.

Path | Purpose
-----|--------
`index.html` | Homepage, styled as a rendered Markdown document
`spec/index.html` | The draft AGENT-README.md specification (v0.1)
`compare/index.html` | AGENTS.md vs. AGENT-README.md comparison
`roadmap/index.html` | Project roadmap (mirrors ROADMAP.md)
`examples/index.html` | Templates gallery
`examples/AGENT-README.*.md` | Copy-paste starter templates (blank, Node, .NET, Python)
`agent-readme.md` | The self-referential example, served from the site root
`badge.svg` | The adoption badge, hotlinkable at `/badge.svg`
`assets/style.css` | The single shared stylesheet
`assets/logo.svg` | The project mark (also used as the favicon)
`web.config` | Web server configuration (default document + `.md` served inline as UTF-8 text)
`scripts/Deploy-Site.ps1` | Deploys the crucial site files to a web server's document root

## Local preview

Serve the repository root with any static file server, for example:

```
python -m http.server 8080
```

Then open `http://localhost:8080/`.

## Deployment

The live site is served as static files at `https://agent-readme.md`.  Because it is just static files, deployment is a copy of the site files into your web server's document root.

Use the included script to copy the deploy set (everything except repository-management files) into a target directory:

```
# Deploy to the default target
.\scripts\Deploy-Site.ps1

# Preview without changing anything
.\scripts\Deploy-Site.ps1 -WhatIf

# Target a specific directory, mirroring (removes stale files first)
.\scripts\Deploy-Site.ps1 -DestinationRoot 'D:\sites' -SiteFolderName 'agent-readme.md' -Clean
```

The included `web.config` maps `.md` to `text/plain; charset=utf-8` so the root `agent-readme.md` renders inline in a browser while remaining trivially fetchable by agents.

### Verifying what is live

Each deploy writes a `version.json` at the site root and stamps every page's `<meta name="version">` tag (and the homepage footer) with the current commit.  To confirm the live site matches the repository, compare the deployed commit against your checkout:

```
curl https://agent-readme.md/version.json
git rev-parse --short HEAD
```

A `-dirty` suffix on the deployed version means the site was built from a working tree with uncommitted changes.

## Licensing

Copyright (c) 2026 Hannah Vernon.

Site prose and the specification are licensed [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) (see `LICENSE`).  The starter templates under `examples/` are released under [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) so they can be dropped into any project without attribution.  The small amount of source code (the deployment script and the SVG assets) is additionally available under the MIT License.
