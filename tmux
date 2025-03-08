#####################################################
##                     Plugins                     ##
#####################################################
## List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-pain-control'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-copycat'
run '~/.tmux/plugins/tpm/tpm'

#####################################################
##                    DEFAULTS                     ##
#####################################################
## Set default color map (256) color emulators
set -g default-terminal "xterm-256color"

# set base to 1 for windows and panes
set -g base-index 1
setw -g pane-base-index 1

# Enable mouse control (clickable windows, panes, resizable panes)
set -g mouse on

# Turn off the default delay when [Escape] is pressed.
set -g escape-time 0

#####################################################
##                  Key Binding                    ##
#####################################################
# remap prefix from 'C-b' to 'C-a'
unbind '"'
unbind '%'
unbind C-b

set-option -g prefix C-s
bind-key C-a send-prefix

## Split panes using | and -
bind '\' split-window -h
bind '-' split-window -v

####################################################
##                  DESIGN CHANGES                ##
####################################################
## Panes
set-option -g pane-border-style fg=black
set-option -g pane-active-border-style fg=brightred

## Pane dividers
setw -g pane-border-style bg=colour235
setw -g pane-border-style fg=colour238
setw -g pane-active-border-style bg=colour196
setw -g pane-active-border-style fg=colour51

# Set the status line to show on top
set-option -g status-position top
## Main status bar setting
setw -g status-style "dim"
setw -g status-style bg=colour235
setw -g status-style fg=colour51
setw -g status-interval 1
setw -g status-position top
setw -g status-justify centre

# Tabs
setw -g window-status-format '#I:#W'
setw -g window-status-style fg=colour1
setw -g window-status-style bg=colour0
setw -g window-status-separator '|'
setw -g window-status-bell-style fg=red
setw -g window-status-bell-style bg=black
setw -g window-status-current-format '*<#I:#W>'
setw -g status-right ""
setw -g status-left ""