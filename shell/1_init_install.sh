# Install SDKMAN
echo "| Installing $fg_bold[yellow]SDKMAN$reset_color"
curl -s "https://get.sdkman.io" | zsh
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Install homebrew
echo "| Installing $fg_bold[yellow]Homebrew$reset_color"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$($(brew --prefix)/bin/brew shellenv)"' >> $HOME/.zprofile
eval $($(brew --prefix)/bin/brew shellenv)

# Install tmux plugin manager
echo "| Installing $fg_bold[yellow]TMUX plugin manager$reset_color"
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Install Oh my Zsh
echo "| Installing $fg_bold[yellow]Oh My Zsh$reset_color"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

FOLDERS=("configurations" ".nvm" ".pyenv")
for f in ${FOLDERS[@]}
do 
    echo "| Creating folder $fg_bold[yellow]$HOME/$f$reset_color"
    mkdir "$HOME/$f"
done

source "$HOME/.zshrc"

##### LINUX Ubuntu theme and tweak tools
#sudo apt update
#sudo apt install gnome-tweak-tool
#sudo apt install oranchelo-icon-theme
#sudo apt install gnome-sushi
