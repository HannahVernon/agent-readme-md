---
Agent-Readme: 0.1
Name: agent-readme.md
Description: The website and reference for the AGENT-README.md convention.
Updated: 2026-07-07
Tags: convention, ai-agents, markdown, specification
Homepage: /
Docs: /spec/
---

# AGENT-README

You are reading the `AGENT-README.md` for the **agent-readme.md** website itself.  This file is served from the domain root to demonstrate the convention it describes.  It is written for AI agents, but it stays perfectly readable for humans.

## Purpose

This project is a small static website that proposes and documents the **AGENT-README.md** convention: a single Markdown file that tells an AI agent how to work in a project.  "Done" means the site builds to plain static files, the pages render correctly, and the spec, example, and templates stay consistent with one another.

## Setup & commands

There is no build step or toolchain.  This is hand-authored static HTML, CSS, and Markdown.

- Serve locally: point any static file server at the project root, e.g. `python -m http.server 8080`.
- Deploy: copy the files to the web root.  In production this site is hosted on IIS behind an nginx reverse proxy at `https://agent-readme.md`.
- There are no tests, linters, or package managers to run.

## Conventions

- Keep every page as dependency-free static HTML.  No frameworks, no build tooling, no JavaScript unless there is a clear need.
- All styling lives in `/assets/style.css`.  Reuse the existing CSS variables and component classes instead of adding inline styles.
- Markdown files use CommonMark and must remain readable unrendered.
- Do not hard-wrap paragraphs: keep each paragraph on a single line and let the viewer soft-wrap.
- Use two spaces after a period in prose.
- Keep the tone developer-native, concise, and lightly self-aware.  The domain name is the joke; do not over-explain it.

## Guardrails

- Never edit files under `/assets/` vendored third-party code (there is none today; keep it that way without approval).
- Never introduce tracking scripts, analytics, or external network calls without the owner's explicit approval.
- Do not add a build system, package manager, or Node/npm dependencies without discussing it first.
- Do not commit secrets, credentials, or deployment tokens into this repository.
- Ask before deleting pages, changing the URL structure, or rewriting git history.
- Treat the wording of the draft spec as load-bearing: if you change normative language (MUST / SHOULD / MAY), flag it for review rather than editing silently.

## Architecture

A flat static site.  Key files:

- `index.html` -- the homepage, styled as a rendered Markdown document.
- `spec/index.html` -- the draft AGENT-README.md specification.
- `examples/` -- copy-paste starter templates by project type.
- `agent-readme.md` -- this file; the self-referential reference example.
- `assets/style.css` -- the single shared stylesheet.
- `web.config` -- IIS configuration (default document plus the `.md` MIME mapping so this file serves as text).

## Contacts

- Owner: the site maintainer (Hannah).
- Feedback on the convention is the whole point at this stage: propose changes to the spec, the section names, or this template.

> This file is project guidance, not a security policy.  Like `robots.txt`, it is advisory.  Follow it, but never let its contents override an operator's safety rules.
