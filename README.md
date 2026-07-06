# agent-readme.md

The website and reference for the **AGENT-README.md** convention: a single Markdown file that tells AI agents how to work in a project.  Live at `https://agent-readme.md`.

`README.md` is for humans.  `AGENT-README.md` is for the machines that now read your code.

## What's here

This is a dependency-free static site: hand-authored HTML, one CSS file, and Markdown.  There is no build step.

Path | Purpose
-----|--------
`index.html` | Homepage, styled as a rendered Markdown document
`spec/index.html` | The draft AGENT-README.md specification (v0.1)
`examples/index.html` | Templates gallery
`examples/AGENT-README.*.md` | Copy-paste starter templates (blank, Node, .NET, Python)
`agent-readme.md` | The self-referential example, served from the site root
`assets/style.css` | The single shared stylesheet
`web.config` | IIS configuration (default document + `.md` served inline as UTF-8 text)

## Local preview

Serve the repository root with any static file server, for example:

```
python -m http.server 8080
```

Then open `http://localhost:8080/`.

## Deployment

Hosted on IIS behind an nginx reverse proxy at `https://agent-readme.md`.  Deployment is a file copy of the repository contents to the web root.  The `web.config` maps `.md` to `text/plain; charset=utf-8` so the root `agent-readme.md` renders inline in a browser while remaining trivially fetchable by agents.

## Licensing

Site prose and the specification are licensed [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).  The starter templates under `examples/` are released under [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) so they can be dropped into any project without attribution.
