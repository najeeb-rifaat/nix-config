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
export PS1="\[\033[38;5;124m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;12m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \w\n\\$ > \[$(tput sgr0)\]"

# Load machine specific customizations
[ -s "$HOME/.bashrc_custome" ] && source $HOME/.bashrc_custome
