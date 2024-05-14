export ZDOTDIR="$HOME/.config/zsh"
export MANPATH="/usr/bin/man:$MANPATH"
export EDITOR='nvim'

source ~/.config/zsh/hist.zsh

export MOZ_ENABLE_WAYLAND=1

# source ~/.config/sway/env.sh

. "$HOME/.cargo/env"

export VCPKG_ROOT="$HOME/dev/vcpkg"
export PATH="$PATH:$VCPKG_ROOT"
