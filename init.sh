#!/bin/bash
yum -y install tmux git wget htop vim net-tools gcc g++

#配置git
cat > ~/.gitconfig<<EOF
[color]
ui = true
[alias]
st = status
co = checkout
lg = log --all --graph --abbrev-commit --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'
br = branch -all
[core]
editor = vim
[push]
default = current
EOF

#配置tmux
cat > ~/.tmux.conf<<EOF
# remap prefix to Control + a
set -g prefix C-a
unbind C-b
bind C-a send-prefix

# force a reload of the config file
unbind r
bind r source-file ~/.tmux.conf

# quick pane cycling
unbind ^A
bind ^A select-pane -t :.+

# split window
unbind '"'
bind - splitw -v # vertical split (prefix -)
unbind %
bind | splitw -h # horizontal split (prefix |)

#set -g default-terminal "screen-256color"

#set-option -g status-bg white
#set-option -g status-fg black

# color
set -g status-fg white
set -g status-bg black
setw -g window-status-fg cyan
setw -g window-status-bg default
#setw -g window-status-attr dim
setw -g window-status-current-fg white
setw -g window-status-current-bg cyan
#setw -g window-status-current-attr bright
set -g pane-border-fg white
#set -g pane-border-bg black
set -g pane-active-border-fg blue
#set -g pane-active-border-bg white
set -g message-fg white
set -g message-bg black
set -g message-attr bright

## status bar
set-option -g status-utf8 on
set -g status-interval 60
set -g status-left "#[fg=green]Session: #S #[fg=yellow]Window: #I #[fg=cyan]Pane: #P"
set -g status-left-length 30
set-option -g status-right "#[fg=cyan]#(date +%H:%M' ')" # right part: time lisk 23:59
set-option -g status-right-length 10 # more space left for center part (window names)
set -g status-justify centre
EOF
