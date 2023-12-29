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

if [ ! -f "$HOME/.zprofile" ]; then 
	ln -s ~/.config/zsh/.zprofile ~/.zprofile
else 
	echo ".zprofile already exists, this config will not work unless the file is already a symbolic link to ~/.config/zsh/.zprofile"
fi

if [ ! -f "$HOME/.config/zsh/custom.sh" ]; then
	echo "creating a custom.sh file for user specific commands"
	touch $HOME/.config/zsh/custom.sh
fi

# if [ ! -f "$HOME/.zshrc" ]; then 
# 	ln -s ~/.config/zsh/.zshrc ~/.zshrc
# else 
# 	echo ".zshrc already exists, this config will not work unless the file is already a symbolic link to ~/.config/zsh/.zshrc"
# fi
