#Prompt and colors
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[cyan]%}%n%{$fg[red]%}@%{$fg[purple]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

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

#alias
alias ls="ls --color=auto"
alias la="ls -la"
alias vim="nvim"
alias sd="setxkbmap us -v dvorak"
alias sq="setxkbmap us"
alias ff="cd \$(fzf -i | rev | cut -d '/' -f 2- | rev)"

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
