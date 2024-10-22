#!/bin/zsh
#
# Set up a tmux session with a few windows and panes
# first window has 3 panes
# The first pane set at 65%, split horizontally, and set to [frontend] root and running vim
# The second pane set at 25%, and runing dev server for [frontend]
# The third pane set to [frontend] root and bash prompt
# 
# note: [frontend] alias to 'cd $HOME/repo/fantasi-agency-operations-system'
#
session="fantasi-agency"

# set up tmux
tmux start-server

# create a new tmux session, starting vim from a saved session in the new window
tmux new-session -d -s $session -n nvim

# Select pane 1, set dir to api root, run vim
tmux selectp -t 1
tmux send-keys "cd $HOME/repo/fantasi-agency-operations-system" C-m

# Split pane 1 horizontal by 65%, start dev server
tmux splitw -h -p 35
tmux send-keys "npm run dev" C-m

# Select pane 2, set dir to api root
tmux selectp -t 2
# Split pane 2 vertical by 25%
tmux splitw -v -p 75

# Select pane 3, set dir to [frontend] root
tmux selectp -t 3
tmux send-keys "cd $HOME/repo/fantasi-agency-operations-system" C-m

# Select pane 1
tmux selectp -t 1

# create a new window called scratch
tmux new-window -t $session:1 -n scratch

# return to main vim window
tmux select-window -t $session:0

# Finished setup, attach to the tmux session!
tmux attach-session -t $session

# starttmux.sh
# os-config/dynamo/sh/starttmux.sh
#/Users/user/.config/nvim/os-config/dynamo/sh/starttmux.sh
