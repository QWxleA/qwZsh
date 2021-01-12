slash-backward-kill-word() {
      local WORDCHARS="${WORDCHARS:s@/@}"
      zle backward-kill-word
  }
zle -N slash-backward-kill-word
bindkey '\e^?' slash-backward-kill-word
#cd /usr/share/doc/mutt/examples/<alt+backspace>
