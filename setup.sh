BASH_PROFILE=".bash_profile"
ZSHRC=".zshrc"
SHELL_FILE=$ZSHRC
CONFIG_FOLDER="configurations"
mkdir $HOME/$CONFIG_FOLDER

# Bash variables
echo "export CONFIG_FOLDER=$HOME/$CONFIG_FOLDER" >> "$HOME/$SHELL_FILE" && echo >> "$HOME/$SHELL_FILE"
echo 'LAMBDA="\[\033\]\[[38;5;208m\]λ\[\033\]\[[0m\]"' >> $HOME/$SHELL_FILE

# Z jumping config
git clone git@github.com:rupa/z.git $HOME/$CONFIG_FOLDER/z
echo ". \$CONFIG_FOLDER/z/z.sh" >> $HOME/$SHELL_FILE && echo >> "$HOME/$SHELL_FILE"

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install baseline packages
brew install docker
brew install tmux
brew install wget
brew install michaeldfallen/formula/git-radar
brew install --cask visual-studio-code
brew install --cask iterm2
brew install --cask slack
brew install --cask jetbrains-toolbox
brew install --cask postman
brew install --cask firefox
brew install --cask spotify
brew install --cask aws-vault
brew install --cask ngrok
brew install --cask redisinsight
brew install jq
brew install nvm
brew install node
brew install yarn
brew install gradle
brew install awscli
brew install redis
brew install mycli
brew install watchman
brew install tfenv
brew install tgenv

# Copy GitHub config
cat scripts/start_env.sh >> "$HOME/$SHELL_FILE" && echo >> "$HOME/$SHELL_FILE"
cat scripts/battery.sh >> "$HOME/$SHELL_FILE" && echo >> "$HOME/$SHELL_FILE"
echo 'setopt PROMPT_SUBST' >> "$HOME/$SHELL_FILE"
echo 'export PROMPT="
%F{214}%T %D{%a %d %b}%f | $BATTERY
%F{45}(%1~)%f %F{121}λ%f\$(git-radar --zsh --fetch) "' >> "$HOME/$SHELL_FILE"
cp .vimrc $HOME/.vimrc
cp .tmux.conf $HOME/.tmux.conf

# Git radar config
echo "export PATH=\$PATH:\$CONFIG_FOLDER/git-radar" >> $HOME/$SHELL_FILE

# Aliases
echo "alias ls='ls -GaFfl'" >> $HOME/$SHELL_FILE
echo "alias p=python3" >> $HOME/$SHELL_FILE
echo "alias restart=\"source \$HOME/$SHELL_FILE\"" >> "$HOME/$SHELL_FILE"


##### LINUX Ubuntu theme and tweak tools
#sudo apt update
#sudo apt install gnome-tweak-tool
#sudo apt install oranchelo-icon-theme
#sudo apt install gnome-sushi