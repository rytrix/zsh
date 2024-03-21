alias z="zypper"
alias v="nvim"
alias flatpak="flatpak --user"
alias update="sudo zypper dup && flatpak update -y"
alias vpy_act="source ~/dev/pvenv/bin/activate"
alias clean="zypper packages --unneeded | awk -F'|' 'NR==0 || NR==1 || NR==2 || NR==3 || NR==4 {next} {print $3}' | grep -v Name | sudo xargs zypper remove --clean-deps"
function fzfd() {
    if [[ -n $1 ]] then
        cd $(find ~/Documents ~/.config -mindepth 1 -maxdepth 3 -type d |  fzf -q $1)
    else
        cd $(find ~/Documents ~/.config -mindepth 1 -maxdepth 3 -type d | fzf)
    fi
}

bindkey -s ^f "tmux-sessionizer\n"
