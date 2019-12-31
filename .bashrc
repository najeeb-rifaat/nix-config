#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load environment variables
source ~/.env

# Load useful aliases
source ~/.alias

# Set shell prompt style
export PS1="\[\033[38;5;160m\]\u\[$(tput sgr0)\]\[\033[38;5;11m\]@\[$(tput sgr0)\]\[\033[38;5;4m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \W\n\\$ > \[$(tput sgr0)\]"

# Load machine specific customizations
[ -s "$HOME/.bashrc_custome" ] && source $HOME/.bashrc_custome
