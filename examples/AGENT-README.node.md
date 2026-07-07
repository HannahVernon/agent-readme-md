---
Agent-Readme: 0.1
Name: my-node-service
Updated: 2026-01-01
Languages: typescript
---

# AGENT-README

## Purpose
A Node.js/TypeScript service. "Done" = type-checks clean, tests pass, and lint is green.

## Setup & commands
- Install: `npm ci`
- Build:   `npm run build`
- Test:    `npm test`
- Lint:    `npm run lint`   # must pass before any commit
- Run dev: `npm run dev`

## Guardrails
- Never edit files under `dist/`, `node_modules/`, or `coverage/`.
- Never commit anything matching `.env*`.
- Do not add dependencies without noting why in the PR description.
- Ask before changing the public API surface in `src/index.ts`.
- Ask before deleting files or rewriting git history.

## Conventions
- TypeScript, strict mode. Do not use `any`; prefer `unknown` and narrow.
- Prettier is the source of truth for formatting; do not hand-format.
- Co-locate tests as `*.test.ts` next to the code under test.
- Prefer named exports.

## Architecture
- `src/` -- application code. Entry point: `src/index.ts`.
- `src/routes/` -- HTTP handlers. `src/lib/` -- shared utilities.
- Deeper docs: `docs/`.

## Contacts
- Owner: @maintainer
- Issues: file in the repo issue tracker.
