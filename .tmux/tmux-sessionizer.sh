#!/usr/bin/env bash

# Collect directories
dirs=$(find ~/work/ ~/suckless/ ~/.config/nvim ~/dotfiles/ -mindepth 1 -maxdepth 1 -type d 2>/dev/null)

# Add "Custom Path" at the top
choices=$(printf "Custom Path\n%s\n" "$dirs")

# Show fzf menu
selected=$(echo "$choices" | fzf)

# Exit if nothing chosen
[[ -z $selected ]] && exit 0

# If "Custom Path" → prompt user for a path
if [[ "$selected" == "Custom Path" ]]; then
    echo -n "Enter path: "
    read -r custom_path
    [[ -z $custom_path ]] && exit 0
    selected="$custom_path"
fi

# Session name is based on basename of path
selected_name=$(basename "$selected" | tr . _)

# If session doesn't exist, create with 2 windows
if ! tmux has-session -t="$selected_name" 2>/dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected"
    tmux new-window -t "$selected_name:" -c "$selected"
fi

# Attach or switch depending on context
if [[ -z $TMUX ]]; then
    tmux attach-session -t "$selected_name"
else
    tmux switch-client -t "$selected_name"
fi

