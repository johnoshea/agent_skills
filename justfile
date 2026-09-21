# just runs recipes with sh by default. Windows ships PowerShell instead.
[windows]
set shell := ["powershell.exe", "-NoLogo", "-NoProfile", "-Command"]

check:
    shellcheck bin/*
    bin/check-skills

# Link every skill into both hosts. Rerun after adding a skill.
[unix]
install:
    mkdir -p ~/.claude/skills ~/.agents/skills
    for dir in "{{justfile_directory()}}"/skills/*/; do \
        name=$(basename "$dir"); \
        ln -sfn "${dir%/}" ~/.claude/skills/"$name"; \
        ln -sfn "${dir%/}" ~/.agents/skills/"$name"; \
    done

# The same links on Windows, as junctions, which need no administrator rights.
# Directory.Delete removes an old junction and leaves its target.
[windows]
install:
    $ErrorActionPreference = 'Stop'; \
    foreach ($skills in (Join-Path $env:USERPROFILE '.claude\skills'), (Join-Path $env:USERPROFILE '.agents\skills')) { \
        New-Item -ItemType Directory -Force -Path $skills | Out-Null; \
        foreach ($skill in Get-ChildItem -Directory skills) { \
            $link = Join-Path $skills $skill.Name; \
            try { [System.IO.Directory]::Delete($link) } catch [System.IO.DirectoryNotFoundException] { }; \
            New-Item -ItemType Junction -Path $link -Target $skill.FullName | Out-Null \
        } \
    }
