# Other installs might be used in aliases
mkdir $ZSH_CUSTOM/completions
gh completion -s zsh > $ZSH_CUSTOM/completions/_gh
cp "./completions/_awsinit" $ZSH_CUSTOM/completions/
cp "./completions/_awsopen" $ZSH_CUSTOM/completions/

gem install colorls
mkdir -p $HOME/.config/colorls
cp "./config/colorls_dark_colors.yaml" $HOME/.config/colorls/dark_colors.yaml
cp "./config/.p10k.zsh" $HOME/.p10k.zsh

SHELL_FILE_PATH="$HOME/.zshrc"
SHELL_FILE_PROFILE_PATH="$HOME/.zprofile"

# Add plugins
cat plugins.txt >> $SHELL_FILE_PATH
echo >> $SHELL_FILE_PATH
echo >> $SHELL_FILE_PATH
echo "export FZF_DEFAULT_OPTS=\"--preview 'bat --color=always {}'\"" >> $SHELL_FILE_PATH
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> $SHELL_FILE_PATH
echo 'source $ZSH/oh-my-zsh.sh' >> $SHELL_FILE_PATH
echo >> $SHELL_FILE_PATH

echo '

############################################
############################################
############ User configuration ############
############################################
############################################

' >> $SHELL_FILE_PATH

# Variables
echo 'export ZSH_COLORIZE_TOOL=pygmentize # or chroma' >> $SHELL_FILE_PATH
echo 'export ZSH_COLORIZE_STYLE=material # https://pygments.org/styles/ or https://github.com/alecthomas/chroma/tree/master/styles for chroma' >> $SHELL_FILE_PATH
echo 'export CONFIG_FOLDER="$HOME/configurations"' >> $SHELL_FILE_PATH
echo 'export LAMBDA="\[\\033\]\[[38;5;208m\]λ\[\\033\]\[[0m\]"' >> $SHELL_FILE_PATH
echo 'export VIRTUAL_ENV_FOLDER="$CONFIG_FOLDER/environments"' >> $SHELL_FILE_PATH
echo 'export LOCAL_GRADLE_CACHE=1' >> $SHELL_FILE_PATH
echo 'export GIT_RADAR_COLOR_BRANCH="$fg_bold[yellow]"' >> $SHELL_FILE_PATH

echo >> $SHELL_FILE_PATH
echo '# openssl@3' >> $SHELL_FILE_PATH
echo '# export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"' >> $SHELL_FILE_PATH
echo '# export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib:$LDFLAGS"' >> $SHELL_FILE_PATH
echo '# export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include:$CPPFLAGS"' >> $SHELL_FILE_PATH
echo '# export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:$PKG_CONFIG_PATH"' >> $SHELL_FILE_PATH

echo >> $SHELL_FILE_PATH
echo '# sqlite' >> $SHELL_FILE_PATH
echo '# export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"' >> $SHELL_FILE_PATH
echo '# export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib:$LDFLAGS"' >> $SHELL_FILE_PATH
echo '# export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include:$CPPFLAGS"' >> $SHELL_FILE_PATH
echo '# export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig:$PKG_CONFIG_PATH"' >> $SHELL_FILE_PATH

echo >> $SHELL_FILE_PATH
echo '# zlib' >> $SHELL_FILE_PATH
echo '# export LDFLAGS="-L/opt/homebrew/opt/zlib/lib:$LDFLAGS"' >> $SHELL_FILE_PATH
echo '# export CPPFLAGS="-I/opt/homebrew/opt/zlib/include:$CPPFLAGS"' >> $SHELL_FILE_PATH
echo '# export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig:$PKG_CONFIG_PATH"' >> $SHELL_FILE_PATH
echo >> $SHELL_FILE_PATH

echo 'ZSH_THEME_AWS_DIVIDER=":"' >> $SHELL_FILE_PATH
echo 'ZSH_THEME_AWS_PROFILE_PREFIX="%{$FG[208]%}"' >> $SHELL_FILE_PATH
echo 'ZSH_THEME_AWS_PROFILE_SUFFIX="%{$reset_color%}"' >> $SHELL_FILE_PATH
echo 'ZSH_THEME_AWS_REGION_PREFIX="%{$FG[208]%}"' >> $SHELL_FILE_PATH
echo 'ZSH_THEME_AWS_REGION_SUFFIX="%{$reset_color%}"' >> $SHELL_FILE_PATH
echo >> $SHELL_FILE_PATH

echo 'setopt PROMPT_SUBST' >> $SHELL_FILE_PATH
echo 'export RPROMPT="%B%{$fg_bold[cyan]%}%D{%a %d %b} %T %{$reset_color%} | \$(battery_pct_prompt)%b | \$(aws_prompt_info)"' >> $SHELL_FILE_PATH
echo 'export PROMPT="

%B%{$fg_bold[green]%}λ %{$fg_bold[cyan]%}%c%{$reset_color%}%b\$(git-radar --zsh --fetch) ➜ "' >> $SHELL_FILE_PATH
echo 'export PATH="/Applications/Firefox.app/Contents/MacOS/firefox:$PATH"' >> $SHELL_FILE_PATH
echo 'export PATH="$PATH:$HOME/.local/bin"' >> $SHELL_FILE_PATH
echo 'export PATH="$HOME/.asdf/shims:$PATH"' >> $SHELL_FILE_PATH

echo >> $SHELL_FILE_PATH
echo 'setopt MENU_COMPLETE' >> $SHELL_FILE_PATH

# Aliases
echo >> $SHELL_FILE_PATH
echo '

############################################
############################################
################# Aliases ##################
############################################
############################################

' >> $SHELL_FILE_PATH
echo '# General' >> $SHELL_FILE_PATH
echo '#alias ls="ls -FlaGh"' >> $SHELL_FILE_PATH
echo 'alias ls="colorls -lA --sd --gs"' >> $SHELL_FILE_PATH
echo 'alias p=python3' >> $SHELL_FILE_PATH
echo 'alias restart="exec zsh"' >> $SHELL_FILE_PATH
echo 'alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox"' >> $SHELL_FILE_PATH
echo 'alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"' >> $SHELL_FILE_PATH
echo 'alias trestart="tmux source $HOME/.tmux.conf"' >> $SHELL_FILE_PATH
echo 'alias less=cless' >> $SHELL_FILE_PATH
echo 'alias cat=ccat' >> $SHELL_FILE_PATH
echo 'alias assume=". assume"' >> $SHELL_FILE_PATH
echo >> $SHELL_FILE_PATH


# Functions
echo >> $SHELL_FILE_PATH
echo '

############################################
############################################
################ Functions #################
############################################
############################################

' >> $SHELL_FILE_PATH
cat scripts/custom_fun_pythonenv.sh >> $SHELL_FILE_PATH
cat scripts/cloud_credentials.sh >> $SHELL_FILE_PATH
cat scripts/aws_athena.sh >> $SHELL_FILE_PATH
echo >> $SHELL_FILE_PATH



# Sources/activations
echo 'source <(fzf --zsh)' >> $SHELL_FILE_PATH
echo 'fpath+=$HOME/.zfunc' >> $SHELL_FILE_PATH
echo 'fpath+=$ZSH_CUSTOM/completions' >> $SHELL_FILE_PATH
echo 'enable-fzf-tab' >> $SHELL_FILE_PATH
echo 'autoload -Uz compinit && compinit' >> $SHELL_FILE_PATH
echo '[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh' >> $SHELL_FILE_PATH
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $SHELL_FILE_PROFILE_PATH

curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | zsh

echo 'zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always \$realpath'' >> $SHELL_FILE_PATH

# Init
source $SHELL_FILE_PATH
exec zsh

