SHELL_FILE_PATH="$HOME/.zshrc"
SHELL_FILE_PROFILE_PATH="$HOME/.zprofile"
# SHELL_FILE_PATH="testfile.sh"

# Add plugins
cat plugins.txt >> $SHELL_FILE_PATH
echo >> $SHELL_FILE_PATH

echo '

############################################
############################################
############ User configuration ############
############################################
############################################

' >> $SHELL_FILE_PATH

# Variables
echo 'export CONFIG_FOLDER="$HOME/configurations"' >> $SHELL_FILE_PATH
echo 'export LAMBDA="\[\\033\]\[[38;5;208m\]λ\[\\033\]\[[0m\]"' >> $SHELL_FILE_PATH
echo 'export VIRTUAL_ENV_FOLDER="$CONFIG_FOLDER/environments"' >> $SHELL_FILE_PATH
echo 'export SDKMAN_DIR="$HOME/.sdkman"' >> $SHELL_FILE_PATH
echo 'export NVM_DIR="$HOME/.nvm"' >> $SHELL_FILE_PATH
echo 'export LOCAL_GRADLE_CACHE=1' >> $SHELL_FILE_PATH
echo 'export GIT_RADAR_COLOR_BRANCH="$fg_bold[yellow]"' >> $SHELL_FILE_PATH
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $SHELL_FILE_PATH
echo 'export PATH="$PYENV_ROOT/shims:$PATH"' >> $SHELL_FILE_PATH

echo '# openssl@3' >> $SHELL_FILE_PATH
echo '# export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"' >> $SHELL_FILE_PATH
echo '# export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib:$LDFLAGS"' >> $SHELL_FILE_PATH
echo '# export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include:$CPPFLAGS"' >> $SHELL_FILE_PATH
echo '# export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:$PKG_CONFIG_PATH"' >> $SHELL_FILE_PATH

echo '# sqlite' >> $SHELL_FILE_PATH
echo '# export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"' >> $SHELL_FILE_PATH
echo '# export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib:$LDFLAGS"' >> $SHELL_FILE_PATH
echo '# export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include:$CPPFLAGS"' >> $SHELL_FILE_PATH
echo '# export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig:$PKG_CONFIG_PATH"' >> $SHELL_FILE_PATH

echo '# zlib' >> $SHELL_FILE_PATH
echo '# export LDFLAGS="-L/opt/homebrew/opt/zlib/lib:$LDFLAGS"' >> $SHELL_FILE_PATH
echo '# export CPPFLAGS="-I/opt/homebrew/opt/zlib/include:$CPPFLAGS"' >> $SHELL_FILE_PATH
echo '# export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig:$PKG_CONFIG_PATH"' >> $SHELL_FILE_PATH

echo 'setopt PROMPT_SUBST' >> $SHELL_FILE_PATH
echo 'export RPROMPT="🚗 💨 💨 %{$fg_bold[cyan]%}%T %D{%a %d %b}%{$reset_color%} | \$(battery_pct_prompt)"' >> $SHELL_FILE_PATH
echo 'export PROMPT="
%B%{$fg_bold[green]%}λ %{$fg_bold[cyan]%}%c%{$reset_color%}%b\$(git-radar --zsh --fetch) ➜ "' >> $SHELL_FILE_PATH


# Aliases
echo >> $SHELL_FILE_PATH
echo '################## Aliases ##################' >> $SHELL_FILE_PATH
echo '# General' >> $SHELL_FILE_PATH
echo 'alias ls="ls -GaFfl"' >> $SHELL_FILE_PATH
echo 'alias p=python3' >> $SHELL_FILE_PATH
echo 'alias restart="exec zsh"' >> $SHELL_FILE_PATH
echo 'alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox"' >> $SHELL_FILE_PATH
echo 'alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"' >> $SHELL_FILE_PATH
echo 'alias trestart="tmux source $HOME/.tmux.conf"' >> $SHELL_FILE_PATH
echo >> $SHELL_FILE_PATH


# Functions
echo >> $SHELL_FILE_PATH
echo '################## Functions ##################' >> $SHELL_FILE_PATH
cat scripts/custom_fun_pythonenv.sh >> $SHELL_FILE_PATH
echo >> $SHELL_FILE_PATH



# Sources/activations
echo 'eval "$(pyenv init -)"' >> $SHELL_FILE_PATH
echo 'source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"' >> $SHELL_FILE_PATH
echo 'source "$(brew --prefix)/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"' >> $SHELL_FILE_PATH
echo '[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"' >> $SHELL_FILE_PATH
echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh" # Load NVM' >> $SHELL_FILE_PATH
echo '[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # Load NVM bash_completion' >> $SHELL_FILE_PATH

echo 'eval "$(pyenv init --path)"' >> $SHELL_FILE_PROFILE_PATH

# Init
source $SHELL_FILE_PATH

