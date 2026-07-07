# Contributing to agent-readme.md

Thanks for your interest in improving the **AGENT-README.md** convention and its website.  This is an early draft (v0.1), so feedback on the spec itself is just as valuable as code.

## Ways to contribute

- **Discuss the spec.** Open a [Discussion](https://github.com/HannahVernon/agent-readme-md/discussions) to propose changes, question a design decision, or share how you are using the convention.
- **Report a problem.** Open an [Issue](https://github.com/HannahVernon/agent-readme-md/issues) for a bug in the site or a concrete gap in the spec.
- **Send a change.** Open a pull request for wording fixes, new templates, or site improvements.

## Project layout

This is a dependency-free static site.  There is no build step, no package manager, and no framework.

- `index.html`, `spec/`, `compare/`, `examples/` - the site pages.
- `agent-readme.md` - the self-referential example, served from the site root.
- `assets/` - the stylesheet and the project mark.
- `scripts/Deploy-Site.ps1` - deploys the site to a web server's document root.

## Branch model

- `main` - release branch.
- `dev` - integration branch.
- Feature and fix work happens on `feature/xxx` or `fix/xxx` branches off `dev`, and merges back into `dev` via pull request.

Use `git switch` to change branches.

## Local preview

Serve the repository root with any static file server, then open `http://localhost:8080/`:

```
python -m http.server 8080
```

## Coding standards

- Keep pages **dependency-free static HTML**.  Reuse the CSS variables and component classes in `assets/style.css` rather than adding inline styles or new frameworks.
- Markdown files use **CommonMark** and must remain readable unrendered.  Do not hard-wrap paragraphs; keep each paragraph on one line.
- **No em-dashes.**  Use commas, colons, parentheses, or a single spaced hyphen ( - ).
- When you change **normative spec language** (MUST / SHOULD / MAY), call it out clearly in the pull request so it can be reviewed carefully.
- If you edit `scripts/Deploy-Site.ps1`, validate it with the PowerShell parser before committing.

## Pull request expectations

- Keep each pull request focused on one logical change.
- Update related documentation in the same change (for example, if you add a page, add it to the `README.md` file tree).
- Fill in the pull request template.

By contributing, you agree that your contributions are licensed under the same terms as this project (see `LICENSE`).
