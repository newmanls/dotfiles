# A U T O S T A R T ------------------------------------------------------------

# Start X at login
if status is-login ; and test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    exec startx -- -keeptty &> "$HOME/.xorg.log"
end

if status is-interactive
  # insert commands here to run when opening a new terminal
end

# F U N C T I O N S ------------------------------------------------------------

# ls when changing directory
function _on_pwd_change --on-variable PWD
  ls
end

# A L I A S E S ----------------------------------------------------------------

alias e='nvim'
alias nsxiv='nsxiv-rifle'
alias trans='trans -brief -t es'

alias ls='lsd'
alias la='lsd --almost-all'
alias ll='lsd --long'
alias lla='lsd --long --almost-all'
alias lt='lsd --tree'
alias lta='lsd --tree --almost-all'

alias gitst='git status --short --branch'
alias gitadd='git add -v'
alias gitcm='git commit -m'
alias gitlog='git log --oneline'
alias gitlast='git log -1 HEAD --stat'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.files/ --work-tree=$HOME'

alias mnt='udisksctl mount -b'
alias umnt='udisksctl unmount -b'

# C O L O R S ------------------------------------------------------------------

set -g fish_color_autosuggestion brblack
set -g fish_color_cancel red
set -g fish_color_command --italics blue
set -g fish_color_comment --italics brblack
set -g fish_color_cwd --bold blue
set -g fish_color_cwd_root --bold red
set -g fish_color_end normal
set -g fish_color_error red
set -g fish_color_escape magenta
set -g fish_color_history_current --bold
set -g fish_color_host --bold yellow
set -g fish_color_host_remote --bold yellow
set -g fish_color_keyword magenta
set -g fish_color_match --bold cyan
set -g fish_color_normal normal
set -g fish_color_operator yellow
set -g fish_color_param normal
set -g fish_color_quote green
set -g fish_color_redirection magenta
set -g fish_color_search_match --background black
set -g fish_color_selection --background black
set -g fish_color_status yellow
set -g fish_color_user --bold green
set -g fish_color_valid_path --underline yellow

set -g fish_pager_color_completion normal
set -g fish_pager_color_description --italics yellow
set -g fish_pager_color_prefix --bold --underline blue
set -g fish_pager_color_progress yellow
