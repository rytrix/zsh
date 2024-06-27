source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.config/zsh/hist.zsh

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1
bindkey "^w" backward-delete-word

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# Custom scripts

function fzfd() {
    if [[ -n $1 ]] then
        location=$(find ~ ~/Documents/programming ~/Documents ~/Documents/classes ~/Documents/dotfiles -mindepth 1 -maxdepth 1 -type d | fzf -q $1)
    else
        location=$(find ~ ~/Documents/programming ~/Documents ~/Documents/classes ~/Documents/dotfiles -mindepth 1 -maxdepth 1 -type d | fzf)
    fi
    cd $location
}

bindkey -s '^F' 'fzfd\n'

alias vol="amixer set Master"
alias mic="amixer set Capture"
alias wifils="nmcli device wifi list"
alias wifid="nmcli con delete"
alias wific="nmcli device wifi connect"
alias bright="brightnessctl s"
alias icat="kitty +kitten icat"
alias themes="kitty +kitten themes"
alias prog="cd ~/Documents/programming"
alias watch_temps="watch -n 2 sensors"

alias ll="ls -la"
alias la="ls -a"
alias ..="cd .."
alias ...="cd ../.."

if [ -f "$HOME/.config/zsh/custom.zsh" ]; then
	. $HOME/.config/zsh/custom.zsh
fi

# eval "$(starship init zsh)"

eval "$(oh-my-posh init zsh --config $HOME/.config/omp.json)"
