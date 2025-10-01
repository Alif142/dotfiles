#!/usr/bin/env bash

# Choose the directory
selected=$(find ~/work/ ~/suckless/ -mindepth 1 -maxdepth 1 -type d | fzf)

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)

# If session doesn't exist, create it with 2 windows
if ! tmux has-session -t="$selected_name" 2>/dev/null; then
    # Create the session detached
    tmux new-session -ds "$selected_name" -c "$selected"

    # Add a second window (only once, when creating the session)
    tmux new-window -t "$selected_name:" -c "$selected"
fi

# Now either switch or attach depending on context
if [[ -z $TMUX ]]; then
    tmux attach-session -t "$selected_name"
else
    tmux switch-client -t "$selected_name"
fi

