# AGENTS.md

## Target Stack

- bash for scripting
- nushell for bigger scripts and data manipulation
- bluebuild cli to build and test the image

## Shape Up

- Use Shape Up pitches for scoped feature work; save pitches under `docs/pitches/`.
- Keep pitch `Solution` sections coarse; do not turn them into task backlogs.

## Security Constraints

- Do not log or expose secrets such as encryption keys, authentication credentials, tokens, or sensitive configuration.

## BlueBuild

## Contribution Conventions

- Use conventional commits: `feat:`, `fix:`, `docs:`, `build:`, `ci:`, `chore:`.
- Branch names should follow `feature/<id>-<slug>` or `bugfix/<id>-<slug>`.
- Use GitHub Flow and keep PRs small.
- Keep CI simple: build and test.
- Release automation is expected from main branch commits via mise tasks; GitVersion is intended for versioning.
