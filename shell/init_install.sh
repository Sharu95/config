# Install SDKMAN
echo "| Installing SDKMAN"
curl -s "https://get.sdkman.io" | zsh
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Install homebrew
echo "| Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> $HOME/.zprofile
eval $($(brew --prefix)/bin/brew shellenv)

# Install tmux plugin manager
echo "| Installing TMUX plugin manager"
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Install Oh my Zsh
echo "| Installing Oh My Zsh"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir "$HOME/.nvm"


##### LINUX Ubuntu theme and tweak tools
#sudo apt update
#sudo apt install gnome-tweak-tool
#sudo apt install oranchelo-icon-theme
#sudo apt install gnome-sushi
