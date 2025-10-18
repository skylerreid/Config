#!/usr/bin/env bash
# dev: start tmux with 2 tabs (Neovim + shell)
# chmod +x ~/.local/bin/dev (don't use .sh in the file extension)
# run "dev" to open a tmux session with nvim in the pwd and a zsh shell behind it

SESSION_NAME=$(basename "$PWD")

# Reattach if already running
if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
  tmux attach -t "$SESSION_NAME"
  exit 0
fi

# Create session detached
tmux new-session -d -s "$SESSION_NAME" -n nvim -c "$PWD"

# First tab: open Neovim
tmux send-keys -t "$SESSION_NAME":nvim 'nvim' C-m

# Second tab: normal shell
tmux new-window -t "$SESSION_NAME" -n shell -c "$PWD"

# Attach with Neovim tab selected
tmux select-window -t "$SESSION_NAME":nvim
tmux attach -t "$SESSION_NAME"
