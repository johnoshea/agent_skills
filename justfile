check:
    shellcheck bin/*
    bin/check-skills

# Link every skill into both hosts. Rerun after adding a skill.
install:
    mkdir -p ~/.claude/skills ~/.agents/skills
    for dir in "{{justfile_directory()}}"/skills/*/; do \
        name=$(basename "$dir"); \
        ln -sfn "${dir%/}" ~/.claude/skills/"$name"; \
        ln -sfn "${dir%/}" ~/.agents/skills/"$name"; \
    done
