#Prompt and colors

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1 ]/p'
}

autoload -U colors && colors	# Load colors
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{cyan}%n%f%F{red}@%f%F{red}%M%f %F{blue}%~%f %F{magenta}$(parse_git_branch)%f%F{red}-%f%F{red}>%f '
#PROMPT='%F{red}[%f%F{cyan}%n%f%F{red}@%f%F{red}%M%f %F{blue}%~%f %F{magenta}$(parse_git_branch)%f%F{red}]%f$ ' #The new one with git branch integration
#PROMPT="%B%{$fg[red]%}[%{$fg[cyan]%}%n%{$fg[red]%}@%{$fg[purple]%}%M %{$fg[magenta]%}%~%{$vcs_info_msg_0_[red]%}%{$fg[red]%}]%{$reset_color%}$%b "

#History
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$HOME/.cache/zsh/history"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

#VI keybindings
bindkey -v
export KEYTIMEOUT=1

#VI keybindings for autocomplete
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

#lf
lfcd () {
    tmp="$(mktemp -uq)"
    trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

#alias
alias gcred="git config --global credential.helper store"
alias ls="ls --color=auto"
alias la="ls -la"
alias js="cd ~/Projects/JavaScript/"
alias rs="cd ~/Projects/Rust/"
alias vim="nvim"
alias sd="setxkbmap us -v dvorak"
alias sq="setxkbmap us"
alias f="cd \$(fzf -i | rev | cut -d '/' -f 2- | rev)"
alias o="vim \$(fzf -i)"

#Auto Completion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#startx when loggedin
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx &>/dev/null
fi

#Path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/Flutter/bin"
export BROWSER="thorium-browser"
export EDITOR="nvim"
export TERMINAL="alacritty"
