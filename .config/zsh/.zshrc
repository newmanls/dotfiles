HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
HISTSIZE=1000
SAVEHIST=1000
PS1="%B%F{blue}%~ %F{%(?.green.red)}>%f%b "
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

autoload -Uz colors && colors
autoload -Uz compinit && compinit
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

setopt autocd nomatch interactive_comments
unsetopt beep notify

zmodload zsh/complist

zstyle ':completion:*' menu select

stty stop undef

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -v
bindkey -v '^?' backward-delete-char
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M vicmd 'j' down-line-or-beginning-search
bindkey -M vicmd 'k' up-line-or-beginning-search

set_cursor_block() { echo -ne '\e[1 q'; }
set_cursor_beam() { echo -ne '\e[5 q'; }
preexec() { set_cursor_beam; }
zle-keymap-select() {
    case "${KEYMAP}" in
        vicmd) set_cursor_block ;;
        viins|main) set_cursor_beam ;;
    esac
}
zle -N zle-keymap-select
set_cursor_beam

source "${XDG_CONFIG_HOME}/shell/aliasrc"
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
