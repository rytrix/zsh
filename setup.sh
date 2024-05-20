if [ ! -d "$HOME/.config/zsh/powerlevel10k" ]; then 
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/powerlevel10k
else
	echo "powerlevel10k already installed"
fi

if [ ! -d "$HOME/.config/zsh/zsh-autosuggestions" ]; then 
	git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
else
	echo "zsh-autosuggestions already installed"
fi

if [ ! -d "$HOME/.config/zsh/zsh-syntax-highlighting" ]; then 
	git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting
else
	echo "zsh-syntax-highlighting already installed"
fi

if [ ! -f "$HOME/.zshenv" ]; then 
    echo "making a symbolic link to .zshenv"
	ln -s ~/.config/zsh/.zshenv ~/.zshenv
else 
	echo ".zshenv already exists, this config will not work unless the file is already a symbolic link to ~/.config/zsh/.zshenv"
fi

if [ ! -f "$HOME/.config/zsh" ]; then 
    echo "creating .zsh_history file"
    touch $HOME/.config/zsh/.zsh_history
fi

if [ ! -f "$HOME/.config/zsh/custom.zsh" ]; then
	echo "creating a custom.zsh file for user specific commands"
	touch $HOME/.config/zsh/custom.zsh
fi
