#fpath+=$ZDOTDIR/pure
autoload -U promptinit && promptinit
#zstyle :prompt:pure:git:stash show yes
#prompt pure

setopt prompt_subst
DEFAULT_USER=plovs #FIXME this is ugly
source $ZDOTDIR/lib/qwxlea.zsh-theme
cat ~/.cache/palete-dark 2>/dev/null
cat ~/.cache/palete-light 2>/dev/null

autoload -U compinit
#compinit
#https://unix.stackexchange.com/questions/391641/separate-path-for-zcompdump-files
mkdir -p ~/.cache/zsh/
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

setopt autocd
setopt extendedglob
setopt NO_NOMATCH

export CLICOLOR=1

trysource() {
    [ -f "$1" ] && source "$1"
    #echo "- loaded $1"
    }

for a in $ZDOTDIR/lib/*.plugin.zsh;do
    trysource "$a"
done

trysource $ZDOTDIR/history.zsh
trysource $ZDOTDIR/keys.zsh
trysource $ZDOTDIR/dotbare/dotbare.plugin.zsh #before completion
trysource $ZDOTDIR/completion.zsh
trysource $ZDOTDIR/aliases.zsh
trysource $HOME/.config/shell/zshnameddirrc
trysource $ZDOTDIR/correction.zsh
trysource $ZDOTDIR/stack.zsh
trysource $ZDOTDIR/fzf-tab/fzf-tab.zsh # before fast-syntax
trysource $ZDOTDIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
trysource $ZDOTDIR/forgit/forgit.plugin.zsh

eval $(dircolors $ZDOTDIR/dircolors-solarized/dircolors.256dark)

if command -v fasd >/dev/null 2>&1; then
  eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias)"
fi
