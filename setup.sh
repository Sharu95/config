setup() {
    # Dotfiles and general configs
    cp dotfiles/.tmux.conf $HOME/.tmux.conf
    cp dotfiles/.vimrc $HOME/.vimrc
    if [[ ! -d "$HOME/.gradle" ]]
    then 
        echo "Creating .gradle folder"
        mkdir "$HOME/.gradle"
    fi
    cp build/gradle.properties .gradle

    # Init shell and libraries
    cd shell
    zsh init_install.sh
    zsh init_brew.sh
    zsh init_shell.sh

    # Init VS code
    cd ../vscode
    zsh init.sh $1

    # TODO: add Iterm2 python API script
}

if [[ $# == 0 ]]
then 
    echo "No platform/machine specified"
else
    setup $1
fi