# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

# User configuration

export MANPATH="/usr/bin/man:$MANPATH"
export EDITOR='nvim'

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zsh_history

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# Custom scripts

# Initialize the loopback module toggle variable
loopback_enabled=false
# Function to toggle the loopback module on and off
function micl() {
    if $loopback_enabled; then
        echo "loopback off"
        pactl unload-module module-loopback
        loopback_enabled=false
    else
        echo "loopback on"
        if [ -n "$1" ]; then
            pactl load-module module-loopback latency_msec="$1"
        else
            pactl load-module module-loopback latency_msec=1000
        fi 
        loopback_enabled=true
    fi
}

alias vol="amixer set Master"
alias mic="amixer set Capture"
alias wifils="nmcli device wifi list"
alias wifid="nmcli con delete"
alias wific="nmcli device wifi connect"
alias bright="brightnessctl s"
alias icat="kitty +kitten icat"
alias prog="cd ~/Documents/programming"
alias watch_gpu="watch -n 2 sensors"
alias update="flatpak update -y && sudo pacman Syu"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
