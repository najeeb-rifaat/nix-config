#####################################################
##                     Plugins                     ##
#####################################################
## List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-pain-control'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'tmux-plugins/tmux-copycat'
set -g @plugin 'thewtex/tmux-mem-cpu-load'
set -g @plugin 'christoomey/vim-tmux-navigator'

run '~/.tmux/plugins/tpm/tpm'

#####################################################
##                    DEFAULTS                     ##
#####################################################
## Set default color map (256) color emulators
set -g default-terminal "xterm-256color"

## VI mode ! in tmux ;)
set-window-option -g monitor-activity off
set-window-option -g mode-keys vi
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel

# loud or quiet?
set-option -g visual-activity off
set-option -g visual-bell off
set-option -g visual-silence off
set-option -g bell-action none

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

## Set leader + tab as toggle
bind TAB last-window

is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
bind-key -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
bind-key -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
bind-key -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
bind-key -n C-'\' if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
bind-key -T copy-mode-vi C-h select-pane -L
bind-key -T copy-mode-vi C-j select-pane -D
bind-key -T copy-mode-vi C-k select-pane -U
bind-key -T copy-mode-vi C-l select-pane -R
bind-key -T copy-mode-vi C-'\' select-pane -l

####################################################
##                  DESIGN CHANGES                ##
####################################################
## Panes
set-option -g pane-border-style fg=black
set-option -g pane-active-border-style fg=brightred

## Messaging
set-option -g message-style fg=black
set-option -g message-style fg=yellow
set-option -g message-command-style fg=blue
set-option -g message-command-style bg=black

## Window mode
setw -g mode-style "bold"
setw -g mode-style fg=colour0
setw -g mode-style bg=colour6
setw -g mode-style fg=colour196
setw -g mode-style bg=colour238
setw -g clock-mode-colour colour135

## Pane dividers
setw -g pane-border-style bg=colour235
setw -g pane-border-style fg=colour238
setw -g pane-active-border-style bg=colour196
setw -g pane-active-border-style fg=colour51

## Main status bar setting
setw -g status-style "dim"
setw -g status-style bg=colour235
setw -g status-style fg=colour51
setw -g status-interval 1
setw -g status-position top
setw -g status-justify centre

## Window setting ( // TODO: explore this )
setw -g window-status-separator '|'
setw -g window-status-bell-style fg=red
setw -g window-status-bell-style bg=black

# others
setw -g window-status-format '#I:#W'
setw -g window-status-style fg=colour1
setw -g window-status-style bg=colour0
# Current selected
setw -g window-status-current-style fg=yellow
setw -g window-status-current-style bg=blue
setw -g window-status-current-format ' <#I:#W> '

setw -g status-left "#[fg=white,bg=black]#(tmux-mem-cpu-load -t 1 -m 1 -a 0 -g 0 -i 1)"
setw -g status-left-length 50

setw -g status-right "#[fg=white,bg=black]#H"
setw -g status-left-length 50
