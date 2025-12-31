# Builtin options {{{
setopt autocd # automatically cd if command is a directory
# }}}
# Completion {{{
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --oneline --group-directories-first --color=always --icons=always $realpath'
# }}}
# Aliases {{{
# Verbosity and settings
alias \
    cp="cp -iv" \
    mv="mv -iv" \
    rm="rm -vI" \
    mkdir="mkdir -pv" \
    yt="yt-dlp" \
    yta="yt -x -f bestaudio/best" \
    ffmpeg="ffmpeg -hide_banner"

# Colorize commands when possible
alias \
    grep="grep --color=auto" \
    diff="diff --color=auto" \
    ip="ip -color=auto" \
    ncdu="ncdu --color dark"

# Programs
alias \
    e='nvim -O' \
    ls='eza --group-directories-first --group --icons=auto' \
    la='ls --all' \
    ll='ls --long' \
    lla='ls --long --all' \
    lt='ls --tree' \
    lta='ls --tree --all' \
    md2pdf='pandoc --from markdown --to pdf --template apa7 --listings' \
    prename='perl-rename' \
    wtr='curl wttr.in/Caracas\?Fq'

# Dotfiles
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# }}}
# Command history {{{
HISTFILE="${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/history"
HISTSIZE=1000
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# }}}
# Keybindings to navigate command history {{{
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -v '^p' up-line-or-beginning-search
bindkey -v '^n' down-line-or-beginning-search
bindkey -a 'k' up-line-or-beginning-search
bindkey -a 'j' down-line-or-beginning-search
# }}}
# Set cursor shape as beam for viins and as block for vicmd {{{
set_cursor_block() { echo -ne '\e[1 q'; }
set_cursor_beam() { echo -ne '\e[5 q'; }
preexec() { set_cursor_beam; }

zle-keymap-select() {
    case "$KEYMAP" in
        vicmd) set_cursor_block ;;
        viins|main) set_cursor_beam ;;
    esac
}

zle-line-init() {
    zle -K viins
    set_cursor_beam
}

zle -N zle-keymap-select
zle -N zle-line-init

set_cursor_beam
# }}}
# Zinit plugin manager {{{
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$ZINIT_HOME"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
# }}}
# Shell integrations for fzf and starship prompt {{{
source <(fzf --zsh)
source <(starship init zsh)
# }}}
# vi:foldmethod=marker:foldmarker={{{,}}}
