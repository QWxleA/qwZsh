fpath+=$ZDOTDIR/pure
autoload -U promptinit && promptinit
zstyle :prompt:pure:git:stash show yes
prompt pure

autoload -U compinit
compinit

setopt autocd
setopt extendedglob
setopt NO_NOMATCH

export CLICOLOR=1

source $ZDOTDIR/fzf-tab # before fast-syntax

source $ZDOTDIR/keys.zsh
source $ZDOTDIR/history.zsh
source $ZDOTDIR/completion.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/correction.zsh
source $ZDOTDIR/stack.zsh
source $ZDOTDIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

if command -v fasd >/dev/null 2>&1; then
  eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias)"
fi
