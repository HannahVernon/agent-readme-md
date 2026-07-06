---
agent_readme: 0.1
project: MyCompany.MyService
updated: 2026-01-01
---

# AGENT-README

## Purpose
A .NET solution. "Done" = the solution builds with zero warnings and all tests pass.

## Setup & commands
- Restore: `dotnet restore`
- Build:   `dotnet build -warnaserror`
- Test:    `dotnet test`
- Format:  `dotnet format`   # run before committing

## Conventions
- Target the version in `global.json` / the `.csproj` `TargetFramework`; do not change it.
- Nullable reference types are enabled. Do not disable them to silence warnings.
- Follow the existing folder-per-feature layout.
- Central package versions live in `Directory.Packages.props`; add versions there, not in individual `.csproj` files.

## Guardrails
- Never edit files under `bin/`, `obj/`, or anything generated.
- Never commit `appsettings.*.json` secrets, connection strings, or `*.pfx` files.
- Do not run database migrations; prepare them and stop for review.
- Keep `NuGetAudit` enabled; do not suppress NU1901-NU1904 audit warnings. Pin patched versions instead.
- Ask before adding a NuGet package or rewriting git history.

## Architecture
- `src/` -- projects. `tests/` -- test projects.
- Solution file: `MyCompany.MyService.sln`.
- Deeper docs: `ARCHITECTURE.md`.

## Contacts
- Owner: @maintainer
- Issues: file in the repo issue tracker.
