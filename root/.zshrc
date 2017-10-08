#
# Executes commands at the start of an interactive session.
#
# Based on zshrc from:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Oh My Zsh
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(git compleat z github osx brew battery themes)

source $ZSH/oh-my-zsh.sh

# from: http://superuser.com/questions/357107/zsh-right-justify-in-ps1
_newline=$'\n'
_lineup=$'\e[1A'
_linedown=$'\e[1B'

PROMPT=$PROMPT${_newline}" >>= "
RPROMPT=%{${_lineup}%}'%* $(battery_level_gauge)'%{${_linedown}%}
# source files from rc.d
# from: https://github.com/jcorbin/home/blob/master/.zshrc
source ~/.zsh/rc.d

# Completion settings
fpath=(~/.zsh/completion $fpath)

# compsys initialization
autoload -U compinit && compinit
zmodload -i zsh/complist

# Aliases
# alias tmux="TERM=screen-256color-bce tmux"
# alias scp="scp -EX"
alias con="tail -40 -f /var/log/system.log"
alias ls="ls -lahL"
alias edit="nvim"
alias vim="nvim"

# Environment variables
export TERM=xterm-256color
export PAGER='nvim -u NONE'
export GIT_EDITOR='nvim -u NONE'
export EDITOR='nvim'
export VISUAL='nvim'
export LANG="hu_HU.UTF-8"
export LC_COLLATE="hu_HU.UTF-8"
export LC_CTYPE="hu_HU.UTF-8"
export LC_MESSAGES="hu_HU.UTF-8"
export LC_MONETARY="hu_HU.UTF-8"
export LC_NUMERIC="hu_HU.UTF-8"
export LC_TIME="hu_HU.UTF-8"
export LC_ALL="hu_HU.UTF-8"

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

# Who doesn't want home and end to work?
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# Incremental search is elite!
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Search based on what you typed in already
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

# oh wow!  This is killer...  try it!
bindkey -M vicmd "q" push-line

# it's like, space AND completion.  Gnarlbot.
bindkey -M viins ' ' magic-space

# Enable syntax highlighting, must be at the end of the config file.
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
