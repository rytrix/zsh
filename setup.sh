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

if [ ! -f "$HOME/.config/zsh/.zsh_history" ]; then 
    echo "creating .zsh_history file"
    touch $HOME/.config/zsh/.zsh_history
fi

if [ ! -f "$HOME/.config/zsh/custom.zsh" ]; then
	echo "creating a custom.zsh file for user specific commands"
	touch $HOME/.config/zsh/custom.zsh
fi

if ! command -v starship &> /dev/null
then
    echo "starship not installed, installing to ~/.local/bin"
    curl -sS https://starship.rs/install.sh | sh
else
    echo "starship already installed"
fi

# if ! command -v oh-my-posh &> /dev/null
# then
#     echo "oh-my-posh not installed, installing to ~/.local/bin"
#     curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/bin
# else
#     echo "oh-my-posh already installed"
# fi
