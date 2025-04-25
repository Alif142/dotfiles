#!/bin/bash

# Session 1: C/C++
tmux has-session -t c_cpp 2>/dev/null || {
  tmux new-session -d -s c_cpp -c /home/alif/work/c_cpp 'nvim'
  tmux new-window -t c_cpp:1 -c /home/alif/work/c_cpp/
}

# Session 2: Python
tmux has-session -t python 2>/dev/null || {
  tmux new-session -d -s python -c /home/alif/.work/python 'nvim'
  tmux new-window -t python:1 -c /home/alif/work/python/
}

# Session 3: Neovim Config
tmux has-session -t nvim_cfg 2>/dev/null || {
  tmux new-session -d -s nvim_cfg -c /home/alif/.config/nvim 'nvim'
}

# Session 4: Home
tmux has-session -t home 2>/dev/null || {
  tmux new-session -d -s home -c /home/alif
}

# FZF session picker
session=$(tmux list-sessions -F "#{session_name}" | fzf --prompt="Pick session: ")

if [ -n "$session" ]; then
  tmux attach-session -t "$session"
fi

