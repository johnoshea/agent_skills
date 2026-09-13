---
name: new-python-project
description: Scaffold a new Python project with John's defaults. uv with the uv_build backend, ruff and complexipy configured in pyproject.toml, a justfile check recipe, and prek hooks that lint on every commit.
disable-model-invocation: true
argument-hint: "<project-name> --lib | --app"
---

# new-python-project

Creates `<project-name>` under the current directory and leaves it with a first commit that passes `just check`. The templates live beside this file under `templates/`.

`--lib` is a package other projects import. `--app` is a program with an entry point. If the argument names neither, ask which.

1. `uv init --lib --build-backend uv <name>` or `uv init --app --build-backend uv <name>`. The flag names the uv_build backend, and uv writes the version pin its docs recommend. If `<name>/.git` is missing afterwards, the current directory is inside a repository. Stop and report.
2. In the new directory, append `templates/pyproject-tools.toml` to `pyproject.toml`, replacing `MODULE` with the directory name uv created under `src/`.
3. `uv add --dev ruff complexipy pytest`. The `exclude-newer` appended in step 2 makes uv choose the newest versions that clear the 14-day cooldown.
4. Copy `templates/justfile` to `justfile` and `templates/pre-commit-config.yaml` to `.pre-commit-config.yaml`. Append `templates/gitignore-tools` to `.gitignore`: the tool caches uv leaves out.
5. Write `tests/test_<module>.py` from `templates/test_smoke.py`, with the same `MODULE` replacement as step 2. pytest fails with no tests, so this test is what lets the first commit pass.
6. `prek install`.
7. `just check`. It passes on a fresh scaffold. If it fails, stop and report.
8. `git add` the files by name: `pyproject.toml uv.lock justfile .pre-commit-config.yaml .gitignore .python-version README.md src tests`. Commit as "Scaffold <name>".

From here the project is ordinary johns-way work. The first feature is sized by the routing rules like any other request.

## What the defaults do

- **ruff.** Line length 88, `E501` off because `ruff format` owns line length, mccabe cyclomatic complexity capped at 10 through `C90`. Public classes, methods, and functions need docstrings, except the stub uv writes and the smoke test. Tests may use `assert`, nested `with`, and temporary paths. Four extra rules flag tests that always pass: a broad `raises` without a match, a duplicated parametrize row, an assert on a string literal, and a value compared with itself.
- **complexipy.** Cognitive complexity capped at 15 over `src` and `tests`, failing the check when exceeded. It catches long flat functions that mccabe scores low.
- **`[tool.uv] exclude-newer`.** The cooldown for machines without the user-level uv setting, such as CI.
- **prek.** Local hooks through `uv run`, so the hook runs the ruff and complexipy versions in `uv.lock`. The lint commands appear in both the justfile and the hook config. Change both together.

## The commit hooks

Git holds one pre-commit hook, so these projects use prek's shim and never `johns-way:install-pre-commit`. The johns-way commit check still runs `just check` before every agent commit, and git then runs prek on the staged files. Lint runs twice per agent commit. Both tools take a fraction of a second on a small project.
