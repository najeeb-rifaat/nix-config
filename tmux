#####################################################
##                    DEFAULTS                     ##
#####################################################
# Set default color map (256) color emulators
set -g default-terminal "xterm-256color"

# VI mode ! in tmux ;)
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
unbind C-b
set-option -g prefix C-s
bind-key C-a send-prefix

# split panes using | and -
bind \ split-window -h
bind - split-window -v

unbind '"'
unbind %

# Set leader + tab as toggle
bind TAB last-window

is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
bind-key -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
bind-key -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
bind-key -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
bind-key -T copy-mode-vi C-h select-pane -L
bind-key -T copy-mode-vi C-j select-pane -D
bind-key -T copy-mode-vi C-k select-pane -U
bind-key -T copy-mode-vi C-l select-pane -R
bind-key -T copy-mode-vi C-\ select-pane -l

####################################################
##                  DESIGN CHANGES                ##
####################################################
# panes
set -g pane-border-fg black
set -g pane-active-border-fg brightred

# messaging
set -g message-fg black
set -g message-bg yellow
set -g message-command-fg blue
set -g message-command-bg black

#window mode
setw -g mode-fg colour0
setw -g mode-bg colour6

setw -g mode-attr bold
setw -g mode-fg colour196
setw -g mode-bg colour238
setw -g clock-mode-colour colour135

# Pane dividers
set -g pane-border-bg colour235
set -g pane-border-fg colour238
set -g pane-active-border-bg colour196
set -g pane-active-border-fg colour51

# main status bar setting
set -g status-attr dim
set -g status-bg colour235
set -g status-fg colour51
set -g status-interval 1
set -g status-position top
set -g status-justify centre

# window setting ( // TODO: explore this )
set -g window-status-separator ''
set -g window-status-bell-fg red
set -g window-status-bell-bg black
set -g window-status-current-fg colour196
set -g window-status-current-bg colour0
set -g window-status-format ' #I:#W '
set -g window-status-current-format ' (#I:#W) '

set -g status-left "#[fg=white,bg=black]#(tmux-mem-cpu-load -t 1 -m 1 -a 0 -g 0 -i 1)"
set -g status-left-length 50

set -g status-right "#[fg=white,bg=black]#H"
set -g status-left-length 50
#####################################################
##                     Plugins                     ##
#####################################################
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-pain-control'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'thewtex/tmux-mem-cpu-load'
set -g @plugin 'christoomey/vim-tmux-navigator'

run '~/.tmux/plugins/tpm/tpm'

