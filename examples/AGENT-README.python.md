---
Agent-Readme: 0.1
Name: my_python_package
Updated: 2026-01-01
Languages: python
---

# AGENT-README

## Purpose
A Python package. "Done" = tests pass, types check, and lint is clean.

## Setup & commands
- Install: `python -m venv .venv && .venv/bin/pip install -e ".[dev]"`
- Test:    `pytest`
- Types:   `mypy src`
- Lint:    `ruff check .`   # must pass before any commit
- Format:  `ruff format .`

## Guardrails
- Never commit `.venv/`, `__pycache__/`, `*.pyc`, or `.env` files.
- Do not pin or upgrade dependencies without noting why in the PR.
- Ask before changing the public API in `src/<package>/__init__.py`.
- Ask before deleting files or rewriting git history.

## Conventions
- Target the Python version pinned in `pyproject.toml`.
- Use type hints on all public functions.
- Ruff is the source of truth for lint and formatting.
- Keep tests under `tests/`, mirroring the package layout.

## Architecture
- `src/<package>/` -- package code.
- `tests/` -- pytest suite.
- Deeper docs: `docs/`.

## Contacts
- Owner: @maintainer
- Issues: file in the repo issue tracker.
