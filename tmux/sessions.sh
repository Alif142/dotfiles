#!/usr/bin/env bash
#
# ==========================================
# Tmux Session Manager — by Alif
# FAST VERSION (fzf)
# ==========================================
# Features:
#   1. fzf-based sessionizer (dynamic)
#   2. static key-based sessions (from config)
#   3. works inside or outside tmux
#   4. creates sessions with two windows
# ==========================================

set -e

CONFIG_FILE="$HOME/.config/tmux/static_sessions.txt"
declare -A PROJECTS

# ------------------------------------------
# Load static sessions (key → directory)
# ------------------------------------------
if [ -f "$CONFIG_FILE" ]; then
  while read -r name path; do
    [[ -z "$name" || "$name" =~ ^# ]] && continue
    PROJECTS["$name"]="$(eval echo "$path")"
  done < "$CONFIG_FILE"
fi

# ------------------------------------------
# Create a tmux session with two windows
# ------------------------------------------
create_session() {
  local name="$1"
  local dir="$2"

  if tmux has-session -t "$name" 2>/dev/null; then
    if [ -n "$TMUX" ]; then
      tmux switch-client -t "$name"
    else
      tmux attach -t "$name"
    fi
    return
  fi

  tmux new-session -d -s "$name" -c "$dir"
  tmux rename-window -t "$name":1 "editor"
  tmux new-window -t "$name" -n "terminal" -c "$dir"
  tmux select-window -t "$name":1

  if [ -n "$TMUX" ]; then
    tmux switch-client -t "$name"
  else
    tmux attach -t "$name"
  fi
}

# ------------------------------------------
# Dynamic fzf-based sessionizer (FAST)
# ------------------------------------------
fzf_sessionizer() {
  DIRS=(
    "$HOME/.config/nvim"
    "$HOME/work"
    "$HOME/.config"
    "$HOME/dotfiles"
  )

  local selected
  selected=$(
    find "${DIRS[@]}" \
      -mindepth 0 -maxdepth 3 \
      -type d 2>/dev/null |
      fzf \
        --margin=10% \
        --color=bg:-1,fg:7,hl:7,bg+:0,fg+:7,hl+:7,info:7,prompt:7,pointer:7,marker:7,spinner:7,header:7
  )

  [[ -z "$selected" ]] && exit 0

  local session_name
  session_name="$(basename "$selected" | tr . _)"

  create_session "$session_name" "$selected"
}

# ------------------------------------------
# CLI Interface
# ------------------------------------------
case "$1" in
  fzf)
    fzf_sessionizer
    ;;
  add)
    if [ -z "$2" ] || [ -z "$3" ]; then
      echo "Usage: $0 add <name> <path>"
      exit 1
    fi
    echo "$2  $3" >> "$CONFIG_FILE"
    echo "Added: $2 → $3"
    ;;
  remove)
    if [ -z "$2" ]; then
      echo "Usage: $0 remove <name>"
      exit 1
    fi
    grep -v "^$2 " "$CONFIG_FILE" > "$CONFIG_FILE.tmp" && mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"
    echo "Removed: $2"
    ;;
  list)
    echo "Static sessions:"
    cat "$CONFIG_FILE"
    ;;
  *)
    if [ -n "$1" ]; then
      dir="${PROJECTS[$1]}"
      if [ -z "$dir" ]; then
        echo "No static session named '$1'"
        echo "Use '$0 list' to see available ones."
        exit 1
      fi
      create_session "$1" "$dir"
    else
      echo "Usage:"
      echo "  sessions.sh fzf                 → dynamic sessionizer (fzf)"
      echo "  sessions.sh <name>               → open static session"
      echo "  sessions.sh add <name> <path>    → add static session"
      echo "  sessions.sh remove <name>        → remove static session"
      echo "  sessions.sh list                 → list static sessions"
    fi
    ;;
esac

exit 0

