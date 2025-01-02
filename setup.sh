autoload -Uz colors; colors; 
setup() {
    if [[ ! -d "$HOME/.gradle" ]]
    then 
        echo "$fg_bold[cyan]-> Creating .gradle folder$reset_color"
        mkdir "$HOME/.gradle"
    fi
    echo "$fg_bold[cyan]-> Moving gradle config$reset_color"
    cp "build/gradle.properties" "$HOME/.gradle"

    # Dotfiles and general configs
    echo "$fg_bold[cyan]-> Moving dotfiles$reset_color"
    cp dotfiles/.tmux.conf $HOME/.tmux.conf
    cp dotfiles/.vimrc $HOME/.vimrc
    cp dotfiles/.gitconfig $HOME/.gitconfig

    FOLDERS=("iterm" "shell" "vscode" "python")
    for f in ${FOLDERS[@]}
    do  
        cd $f
        echo "$fg_bold[cyan]-> Running setup in $f$reset_color"
        source init.sh
        cd ../
    done
}

if [[ $# == 0 ]]
then 
    echo "$fg_bold[red]No platform/machine specified <mac | linux>$reset_color"
    exit
else
    setup $1
fi