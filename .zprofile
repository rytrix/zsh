# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/bin/personal" ] ; then
    PATH="$HOME/.local/bin/personal:$PATH"
fi

export ZDOTDIR="$HOME/.config/zsh"
export MANPATH="/usr/bin/man:$MANPATH"
export EDITOR='nvim'

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.cache/zsh/.zsh_history

export MOZ_ENABLE_WAYLAND=1
