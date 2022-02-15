BASH_PROFILE=".bash_profile"
ZSHRC=".zshrc"
SHELL_FILE=$ZSHRC
CONFIG_FOLDER="configurations"
mkdir $HOME/$CONFIG_FOLDER

# Bash variables
echo "export CONFIG_FOLDER=$HOME/$CONFIG_FOLDER" >> "$HOME/$SHELL_FILE" && echo >> "$HOME/$SHELL_FILE"
echo 'LAMBDA="\[\033\]\[[38;5;208m\]λ\[\033\]\[[0m\]"' >> $HOME/$SHELL_FILE

# Z jumping config
git clone https://github.com/rupa/z $HOME/$CONFIG_FOLDER/z
echo ". \$CONFIG_FOLDER/z/z.sh" >> $HOME/$SHELL_FILE && echo >> "$HOME/$SHELL_FILE"

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install sdkman 
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

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
brew install awslogs
brew install redis
brew install mycli
brew install watchman
brew install tfenv
brew install tgenv
brew install pyenv
brew install jenv
brew install google-chrome

# Install and apply versions
# pyenv install 3.7.0




# Copy GitHub config
cat scripts/start_env.sh >> "$HOME/$SHELL_FILE" && echo >> "$HOME/$SHELL_FILE"
cat scripts/battery.sh >> "$HOME/$SHELL_FILE" && echo >> "$HOME/$SHELL_FILE"
echo 'setopt PROMPT_SUBST' >> "$HOME/$SHELL_FILE"
echo 'export PROMPT="
%F{214}%T %D{%a %d %b}%f | $BATTERY
%F{45}(%1~)%f %F{121}λ%f\$(git-radar --zsh --fetch) "' >> "$HOME/$SHELL_FILE"
cp .vimrc $HOME/.vimrc
cp .tmux.conf $HOME/.tmux.conf

# nvm, jenv, git-radar
mkdir $HOME/.nvm
echo "export PATH=\$PATH:\$CONFIG_FOLDER/git-radar" >> $HOME/$SHELL_FILE
echo "export PATH=\$HOME/.jenv/bin:\$PATH" >> $HOME/$SHELL_FILE
echo "export NVM_DIR=\"\$HOME/.nvm\"" >> $HOME/$SHELL_FILE
echo "[ -s \"\$(brew --prefix)/opt/nvm/nvm.sh\" ] && . \"\$(brew --prefix)/opt/nvm/nvm.sh\" #This loads nvm" >> $HOME/$SHELL_FILE
echo "[ -s \"\$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm\" ] && . \"\$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm\" # This loads nvm bash_completion" >> $HOME/$SHELL_FILE

# Aliases
echo "alias ls='ls -GaFfl'" >> $HOME/$SHELL_FILE
echo "alias p=python3" >> $HOME/$SHELL_FILE
echo "alias restart=\"source \$HOME/$SHELL_FILE\"" >> "$HOME/$SHELL_FILE"
echo "alias trestart='tmux source \$HOME/.tmux.conf'"


# Other 
echo "export SDKMAN_DIR=\"\$HOME/.sdkman\"" >> $HOME/$SHELL_FILE
echo "[[ -s \"\$HOME/.sdkman/bin/sdkman-init.sh\" ]] && source \"\$HOME/.sdkman/bin/sdkman-init.sh\"" >> $HOME/$SHELL_FILE
echo "export LOCAL_GRADLE_CACHE=1" >> $HOME/$SHELL_FILE


##### LINUX Ubuntu theme and tweak tools
#sudo apt update
#sudo apt install gnome-tweak-tool
#sudo apt install oranchelo-icon-theme
#sudo apt install gnome-sushi
