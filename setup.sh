#!/usr/bin/env bash
set -e

REPO="https://raw.githubusercontent.com/forrestchang/andrej-karpathy-skills/main"

SKILLS=(
  "karpathy-guidelines:Core LLM coding guidelines (Think Before Coding, Simplicity First, Surgical Changes, Goal-Driven Execution)"
  "testing-first:Write a failing test before fixing bugs or adding features"
  "pr-hygiene:Keep pull requests small, focused, and easy to review"
  "api-design:Design stable, minimal, unsurprising APIs"
  "security-defaults:Apply secure defaults when handling data, credentials, or user input"
)

TARGET="${1:-CLAUDE.md}"

echo "Andrej Karpathy Skills — setup"
echo "Output file: $TARGET"
echo ""
echo "Available skills:"
for i in "${!SKILLS[@]}"; do
  name="${SKILLS[$i]%%:*}"
  desc="${SKILLS[$i]#*:}"
  printf "  [%d] %-25s %s\n" "$((i+1))" "$name" "$desc"
done
echo ""
echo "Enter skill numbers to install (space-separated), or 'all' for everything:"
read -r selection

if [ "$selection" = "all" ]; then
  selected=("${SKILLS[@]}")
else
  selected=()
  for n in $selection; do
    idx=$((n-1))
    if [ "$idx" -ge 0 ] && [ "$idx" -lt "${#SKILLS[@]}" ]; then
      selected+=("${SKILLS[$idx]}")
    else
      echo "Skipping invalid selection: $n"
    fi
  done
fi

if [ "${#selected[@]}" -eq 0 ]; then
  echo "No skills selected. Exiting."
  exit 0
fi

echo ""
for entry in "${selected[@]}"; do
  name="${entry%%:*}"
  echo "Adding $name..."
  printf "\n" >> "$TARGET"
  curl -fsSL "$REPO/skills/$name/SKILL.md" >> "$TARGET"
done

echo ""
echo "Done. Added ${#selected[@]} skill(s) to $TARGET."
