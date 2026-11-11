#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

ln -sfn "$repo_dir/.bashrc" "$HOME/.bashrc"
ln -sfn "$repo_dir/.zshrc" "$HOME/.zshrc"
mkdir -p "$HOME/.config"
ln -sfn "$repo_dir/.config/starship.toml" "$HOME/.config/starship.toml"

printf 'Linked Bash, Zsh, and Starship configuration from %s\n' "$repo_dir"
