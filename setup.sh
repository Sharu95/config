setup() {
    if [[ ! -d "$HOME/.gradle" ]]
    then 
        echo "| Creating .gradle folder"
        mkdir "$HOME/.gradle"
    fi
    cp build/gradle.properties .gradle

    # Dotfiles and general configs
    cp dotfiles/.tmux.conf $HOME/.tmux.conf
    cp dotfiles/.vimrc $HOME/.vimrc

    # Set init iterm preferences
    # TODO: add Iterm2 python API script
    cd iterm 
    zsh init.sh

    # Init shell and libraries
    cd ../shell
    zsh init.sh

    # Init VS code
    cd ../vscode
    zsh init.sh $1

    cd ../python
    zsh init.sh

}

if [[ $# == 0 ]]
then 
    echo "| No platform/machine specified"
    exit
else
    setup $1
fi