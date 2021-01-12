HISTFILE=$XDG_CACHE_HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
HISTCONTROL=ignoredups

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt HIST_IGNORE_SPACE #makes it easy to *not* have something in history
