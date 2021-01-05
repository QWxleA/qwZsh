#fpath+=$ZDOTDIR/pure
autoload -U promptinit && promptinit
#zstyle :prompt:pure:git:stash show yes
#prompt pure

setopt prompt_subst
DEFAULT_USER=plovs
source $ZDOTDIR/lib/qwxlea.zsh-theme
cat ~/.cache/palete-dark 2>/dev/null
cat ~/.cache/palete-light 2>/dev/null

autoload -U compinit
compinit

setopt autocd
setopt extendedglob
setopt NO_NOMATCH

export CLICOLOR=1

for a in $ZDOTDIR/lib/*.plugin.zsh;do
    source "$a"
done

source $ZDOTDIR/history.zsh
source $ZDOTDIR/keys.zsh
source $ZDOTDIR/completion.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/correction.zsh
source $ZDOTDIR/stack.zsh
source $ZDOTDIR/fzf-tab/fzf-tab.zsh # before fast-syntax
source $ZDOTDIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZDOTDIR/forgit/forgit.plugin.zsh

if command -v fasd >/dev/null 2>&1; then
  eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias)"
fi
