# set PATH so it includes user's private bin if it exists
if [ ! -d "$HOME/.local/bin" ] ; then
    mkdir -p $HOME/.local/bin
fi
PATH="$HOME/.local/bin:$PATH"
XDG_DATA_DIRS="/usr/local/share/applications:$XDG_DATA_DIRS"
XDG_DATA_DIRS="$HOME/.local/share/applications:$XDG_DATA_DIRS"

if [ ! -d "$HOME/.local/bin/personal" ] ; then
    mkdir -p $HOME/.local/bin/personal
fi
PATH="$HOME/.local/bin/personal:$PATH"
