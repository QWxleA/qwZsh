# -*- mode:sh -*-
# QW -- (Almost) cross shell aliases and exports
#
# depends: br, lsd, git

# UTILITY

alias less='less -R'
alias grep='grep --color=auto'
alias ..='cd ../'

# GIT

alias ga='git add'
alias gc!='git commit -v --amend'
alias gc='git commit -v'
alias gca!='git commit -v -a --amend'
alias gca='git commit -am'
alias gca='git commit -v -a'
alias gcam='git commit -a -m'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcans!='git commit -v -a -s --no-edit --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gco='git checkout'
alias gcsm='git commit -s -m'
alias gd='git diff'
alias gl='git pull'
alias gp='git push'
alias gpp='git pull; git push'
alias gs='git status'
alias gst='git status'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias gpo='git push origin'

#https://wiki.archlinux.org/index.php/Dotfiles#Tracking_dotfiles_directly_with_Git
alias dot="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"
alias dot_list_untracked="dot ls-files . --exclude-standard --others"
alias dot_list_ignored="dot ls-files . --ignored --exclude-standard --others"
alias dotlol="dot log --oneline --graph --decorate --all"
alias dotstatus="dot status"
alias dotcommit_all="dot commit -am"

#compdef '_files' dot
# compdef dot=git
# setopt complete_aliases
# unsetopt complete_alises

alias dots="dot status"
alias dota="dot add"
alias dotcm="dot commit -m"
alias dotp="dot push"
alias dotbackup="cd /Storage/Backup/dotfiles && git pull"

#export EDITOR="eclient"
#export EDITOR="emacsclient -cn -F '((name . \"emacs-popup\"))'"
export e2="emacsclient -cn -F '((name . \"emacs-popup\"))'"
export EDITOR="eemacs"
export VISUAL="nvim"
export ALTERNATE_EDITOR="nvim"

alias killemacs="emacsclient -e '(client-save-kill-emacs)'"

alias edzshrc="$EDITOR $ZDOTDIR/.zshrc && . $ZDOTDIR/.zshrc"
alias edaliases="$EDITOR $ALIASRC && source $ALIASRC"
alias eddotfiles="$EDITOR ~/.config"
alias edsway="$EDITOR ~/.config/sway/config"
alias edwm="$EDITOR $XDG_CONFIG_HOME/$WM"

alias orgmacs='emacs -q --load "~/.config/orgmacs/orginit.el" -name "orgmacs"'
alias orgmacsfg='emacs -q --load "~/.config/orgmacs/orginit.el" -name "orgmacs" --fg-daemon="orgmacs"'
alias orgmacsbg='emacs -q --load "~/.config/orgmacs/orginit.el" -name "orgmacs" --daemon="orgmacs"'
alias killorgmacs='emacsclient -s orgmacs --eval "(kill-emacs)"'

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Use neovim for vim if present. Added vi alias
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d" vi="nvim"
# root also uses neovim
[ -x "$(command -v nvim)" ] && alias svim="sudo nvim"

# Browser - set in zshenv!
#export BROWSER="/usr/bin/brave"
#export BROWSER="/usr/bin/firefox"
# export BROWSER="/usr/bin/chromium"
export BROWSER="qutebrowser"
export Downloads="$HOME/Downloads"

alias mirror="wget --mirror --convert-links --adjust-extension --page-requisites --no-parent"

alias yt="youtube-dl \
      --format 'bestvideo[height<=480]+bestaudio/best[height<=480]' \
      --merge-output-format mp4 \
      --add-metadata -i \
      -o \"$Downloads/%(title)s.%(ext)s\""

alias ytbest="youtube-dl \
      --format best \
      --merge-output-format mp4 \
      --add-metadata -i \
      -o \"$Downloads/%(title)s.%(ext)s\""


#      yt720="youtube-dl --format 'bestvideo[height<=720]+bestaudio/best[height<=720]' --merge-output-format mp4 --add-metadata -i -o \"$Downloads/%(title)s.%(ext)s\""
# Verbosity and settings that you pretty much just always are going to want.

# alias yta="youtube-dl -x -f bestaudio/best"

#alias yta=youtube-dl --audio-quality 0 -i --extract-audio --audio-format mp3 -o '$HOME/Music/_Incoming/%(title)s.%(ext)s' --add-metadata --embed-thumbnail --metadata-from-title "%(artist)s - %(title)s" YOUTUBE_LINKS

# pip3 install mutagen --user to embed thumbnails
alias "ytm=youtube-dl \
      --extract-audio \
      --audio-format mp3 \
      --audio-quality 0  \
      --embed-thumbnail \
      --add-metadata \
      --metadata-from-title '%(artist)s - %(title)s' \
      -o '$HOME/Music/_Incoming/%(title)s.%(ext)s'"

alias \
    cp="cp -iv" \
    mv="mv -iv" \
    rm="rm -vI" \
    mkd="mkdir -pv" \
    ffmpeg="ffmpeg -hide_banner"

# Colorize commands when possible.
        # ls="ls -hN --color=auto --group-directories-first" \
alias \
    grep="grep --color=auto" \
    diff="diff --color=auto" \
    ccat="highlight --out-format=ansi"

# These common commands are just too long! Abbreviate them.
alias \
    ka="killall" \
    trem="transmission-remote" \
    YT="youtube-viewer" \
    sdn="sudo shutdown -h now" \
    f="$FILE" \
    e="$EDITOR" \
    v="$EDITOR" \
    xi="sudo xbps-install" \
    xr="sudo xbps-remove -R" \
    xq="xbps-query" \
    z="zathura"

alias \
    magit="nvim -c MagitOnly" \
    ref="shortcuts >/dev/null; source ${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc ; source ${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc" \
    weath="less -S ${XDG_DATA_HOME:-$HOME/.local/share}/weatherreport" \
    tmux="tmux -f ${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf"

alias wwget="wget --no-check-certificate"
alias clock="/usr/lib/xscreensaver/gluqlo -f"

alias wiki="w3m https://wiki.archlinux.org/"
alias w3mb="w3m ~/.w3m/bookmark.html"

#TODO move!
#single letter aliases - start with space to avoid history
alias e=$EDITOR
alias o=xdg-open
alias l=" lsd"
alias ll=" ls -lh"

#Media players
#mpvsocket can be used to pause all windows when locking the screen
alias mpvsocket="mpv --input-ipc-server=/tmp/mpvsocket-$(date +%s)" #
function mpvpause() {
    for a in $(pgrep -a mpv | grep "\-\-input-ipc-server" | awk '{print $3}' | sed "s/--input-ipc-server=\/tmp\///g");do
        echo '{ "command": ["set_property", "pause", true] }' | socat - "/tmp/$a"
    done
    }
alias mpv="prime-run mpv --input-ipc-server=/tmp/mpvsocket-$(date +%s)"
alias m="prime-run mpv --input-ipc-server=/tmp/mpvsocket-$(date +%s)"

# Arch & pacman
alias aw="arch-wiki"
aurpull() { git clone https://aur.archlinux.org/$1; }

#WEB
alias serve="xdg-open $BROWSER; python -m http.server 8080"
alias myip="curl 'http://icanhazip.com/'"
alias myipinfo="curl 'http://ipinfo.io'"

#misc
alias changedfiles="find . -type f -print0 | xargs -0 stat --format '%Z :%z %n' | sort -nr | cut -d: -f2- | head -n 20"
alias cheatsway="egrep bind ~/.config/sway/bindings | cut -d ' ' -f 2- | sed 's/ /\t/' | column  -c 4 | pr -2 -w 145 -t | less"

#TODO fix!
alias shrug='echo -n "¯\_(ツ)_/¯" | wl-copy && echo "\"¯\_(ツ)_/¯\" copied to clipboard!"'

alias dus='du -sh * | sort -h'

alias -g 2grep='| grep -i'
alias -g 2less='| less'

alias d='dirs -v | head -10'

#from OSX - xclip -selection clipboard
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias xprop2='xprop | grep "WM_CLASS\|WM_NAME"'

# http://rayninfo.co.uk/tips/zshtips.html - haha bash
alias -g G='| grep '
alias -g P='2>&1 | $PAGER'
alias -g L='| less'
alias -g LA='2>&1 | less'
alias -g M='| most'
#alias -g C='| wc -l'

# TODO suffix aliases
alias -s mp4=" xdg-open"

####### Functions ##########

cd() { builtin cd "$@" && ls; }


function genpass() { head -c 500 /dev/urandom | tr -dc a-z0-9A-Z | head -c $1; echo; }

function mcd() {
    mkdir -p $1 && cd &1
}

# Stopwatch/countdown
function stopwatch(){
    date1=`date +%s`;
    echo
    while true; do
        tput bold
        # bold can't be turned off by itself so this
        # turns off all attributes
        echo -ne "  $(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
        tput sgr0
        sleep 0.1
    done
}

function countdown(){
    date1=$((`date +%s` + $1));
    while [ "$date1" -ge `date +%s` ]; do
        echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
        sleep 0.1
    done
}

# This script was automatically generated by the broot program
# More information can be found in https://github.com/Canop/broot
# This function starts broot and executes the command
# it produces, if any.
# It's needed because some shell commands, like `cd`,
# have no useful effect if executed in a subshell.
function br {
    f=$(mktemp)
    (
    set +e
    broot --outcmd "$f" "$@"
    code=$?
    if [ "$code" != 0 ]; then
        rm -f "$f"
        exit "$code"
    fi
    )
    code=$?
    if [ "$code" != 0 ]; then
    return "$code"
    fi
    d=$(<"$f")
    rm -f "$f"
    eval "$d"
}

# function tree {
#      br -c :pt "$@"
# }

# function hnp {
#     hugo new posts/$1.md
#     $EDITOR /home/plovs/Projects/Writing/content/posts/$1.md
# }

# function writing {
#     cd ~/Projects/Writing && \
#     code .
# }

#function gh-download {
#    curl -sL https://api.github.com/repos/$1/$2/releases/latest | jq -r '.assets[].browser_download_url' | grep "$3" | wget -qi -
#}

function my-accept-line() {
    # check if the buffer does not contain any words
    if [ ${#${(z)BUFFER}} -eq 0 ]; then
        # put newline so that the output does not start next
        # to the prompt
        echo
        # check if inside git repository
        if git rev-parse --git-dir > /dev/null 2>&1 ; then
            # if so, execute `git status'
            git status
        else
            # else run `ls'
            lsd
        fi
    fi
    # in any case run the `accept-line' widget
    zle .accept-line
}

# create a widget from `my-accept-line' with the same name
zle -N accept-line my-accept-line
# rebind Enter, usually this is `^M'
bindkey '^M' accept-line

function myproj() {
    export CURPROJ=$(~/bin/curproj)
    }

function 2backup() {
    P=$(basename $(pwd))
    target=$(echo "${P}-$1" | sed -e "s/ /-/g" -e "s/\./_/g")
    mv "$1" "~/Backup/$target"
}

##### Arch-Linux

if (( $+commands[yay] )); then
  alias yaconf='yay -Pg'
  alias yaupg='yay -Syu'
  alias yasu='yay -Syu --noconfirm'
  alias yain='yay -S'
  alias yains='yay -U'
  alias yare='yay -R'
  alias yarem='yay -Rns'
  alias yarep='yay -Si'
  alias yareps='yay -Ss'
  alias yaloc='yay -Qi'
  alias yalocs='yay -Qs'
  alias yalst='yay -Qe'
  alias yaorph='yay -Qtd'
  alias yainsd='yay -S --asdeps'
  alias yamir='yay -Syy'


  if (( $+commands[abs] && $+commands[aur] )); then
    alias yaupd='yay -Sy && sudo abs && sudo aur'
  elif (( $+commands[abs] )); then
    alias yaupd='yay -Sy && sudo abs'
  elif (( $+commands[aur] )); then
    alias yaupd='yay -Sy && sudo aur'
  else
    alias yaupd='yay -Sy'
  fi
fi



alias upgrade="yay -Syu"

# Pacman - https://wiki.archlinux.org/index.php/Pacman_Tips
alias pacupg='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacins='sudo pacman -U'
alias pacre='sudo pacman -R'
alias pacrem='sudo pacman -Rns'
alias pacrep='pacman -Si'
alias pacreps='pacman -Ss'
alias pacloc='pacman -Qi'
alias paclocs='pacman -Qs'
alias pacinsd='sudo pacman -S --asdeps'
alias pacmir='sudo pacman -Syy'
alias paclsorphans='sudo pacman -Qdt'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'
alias pacfileupg='sudo pacman -Fy'
alias pacfiles='pacman -F'
alias pacls='pacman -Ql'
alias pacown='pacman -Qo'

function paclist() {
  # Source: https://bbs.archlinux.org/viewtopic.php?id=93683
  LC_ALL=C pacman -Qei $(pacman -Qu | cut -d " " -f 1) | \
    awk 'BEGIN {FS=":"} /^Name/{printf("\033[1;36m%s\033[1;37m", $2)} /^Description/{print $2}'
}

function pacdisowned() {
  emulate -L zsh

  tmp=${TMPDIR-/tmp}/pacman-disowned-$UID-$$
  db=$tmp/db
  fs=$tmp/fs

  mkdir "$tmp"
  trap  'rm -rf "$tmp"' EXIT

  pacman -Qlq | sort -u > "$db"

  find /bin /etc /lib /sbin /usr ! -name lost+found \
    \( -type d -printf '%p/\n' -o -print \) | sort > "$fs"

  comm -23 "$fs" "$db"
}

function pacmanallkeys() {
  emulate -L zsh
  curl -s https://www.archlinux.org/people/{developers,trustedusers}/ | \
    awk -F\" '(/pgp.mit.edu/) { sub(/.*search=0x/,""); print $1}' | \
    xargs sudo pacman-key --recv-keys
}

function pacmansignkeys() {
  emulate -L zsh
  for key in $*; do
    sudo pacman-key --recv-keys $key
    sudo pacman-key --lsign-key $key
    printf 'trust\n3\n' | sudo gpg --homedir /etc/pacman.d/gnupg \
      --no-permission-warning --command-fd 0 --edit-key $key
  done
}

if (( $+commands[xdg-open] )); then
  function pacweb() {
    pkg="$1"
    infos="$(LANG=C pacman -Si "$pkg")"
    if [[ -z "$infos" ]]; then
      return
    fi
    repo="$(grep -m 1 '^Repo' <<< "$infos" | grep -oP '[^ ]+$')"
    arch="$(grep -m 1 '^Arch' <<< "$infos" | grep -oP '[^ ]+$')"
    xdg-open "https://www.archlinux.org/packages/$repo/$arch/$pkg/" &>/dev/null
  }
fi

## QW fzf

fmpc() {
  local song_position
  song_position=$(mpc -f "%position%) %artist% - %title%" playlist | \
    fzf-tmux --header="♬ MPD Playlist Queue" --query="$1" --reverse --select-1 --exit-0 | \
    sed -n 's/^\([0-9]\+\)).*/\1/p') || return 1
  [ -n "$song_position" ] && mpc -q play $song_position
}

## Preview: Try highlight, coderay, rougify in turn, then fall back to cat
fcat () {
  fzf --preview '[[ $(file --mime {}) =~ binary ]] &&
               echo {} is a binary file ||
               (highlight -O ansi -l {} ||
               coderay {} ||
               rougify {} ||
               cat {}) 2> /dev/null | head -500'
}
