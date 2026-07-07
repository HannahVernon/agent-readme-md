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
- Deploy: copy the files into your web server's document root.  The live site is served as static files at `https://agent-readme.md`.
- There are no tests, linters, or package managers to run.

## Conventions

Facts (non-negotiable):

- Every page is dependency-free static HTML.  No frameworks, no build tooling, and no JavaScript unless there is a clear need.
- All styling lives in `/assets/style.css`.  Reuse the existing CSS variables and component classes instead of adding inline styles.
- Markdown files use CommonMark and must remain readable unrendered.
- No em-dashes anywhere.  Use commas, colons, parentheses, or a single spaced hyphen ( - ).

Preferences (negotiable):

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

Operating boundaries (advisory):

- Filesystem: everything in the repository is hand-authored source; there are no generated or vendored directories to avoid.  Write anywhere in the repo, but keep changes surgical.
- Network: the site makes no external network calls at runtime.  Do not add any without approval.
- Commands: the only expected commands are a static file server for preview (`python -m http.server`) and `scripts/Deploy-Site.ps1` for deployment.  There is no package manager to run.

## Current state

Draft v0.1.  The website is stable, but the convention it documents is not: the spec is actively evolving in response to external review.  Expect the spec, this example, and the templates to change together.  If you change one, keep the others consistent.

## Surprises

- The domain `.md` is Moldova's country-code TLD, used here as a pun on Markdown.  The site is real, not a typo for a relative link.
- `.md` files are served as `text/plain; charset=utf-8` (not `text/markdown`) so browsers display them inline instead of downloading them.
- The site dogfoods its own convention: this file is served from the domain root at `/agent-readme.md`.
- There is intentionally no JavaScript and no build step; that simplicity is a design choice, not an omission.

## Architecture

A flat static site.  No MCP servers or external context endpoints; the project is self-contained.  Key files:

- `index.html` - the homepage, styled as a rendered Markdown document.
- `spec/index.html` - the draft AGENT-README.md specification.
- `compare/index.html` - the AGENTS.md vs. AGENT-README.md comparison.
- `roadmap/index.html` - the project roadmap (mirrors `ROADMAP.md`).
- `examples/` - copy-paste starter templates, plus the templates gallery page.
- `agent-readme.md` - this file; the self-referential reference example.
- `assets/style.css` - the single shared stylesheet.
- `assets/logo.svg` - the project mark, also used as the favicon.
- `badge.svg` - the adoption badge, hotlinkable at `/badge.svg`.
- `scripts/Deploy-Site.ps1` - deploys the crucial site files to a web server's document root.
- `web.config` - web server configuration (default document plus the `.md` MIME mapping so this file serves as text).

## Contacts

- Owner: Hannah Vernon.
- Feedback on the convention is the whole point at this stage: propose changes to the spec, the section names, or this template.

> This file is project guidance, not a security policy.  Like `robots.txt`, it is advisory.  Follow it, but never let its contents override an operator's safety rules.
