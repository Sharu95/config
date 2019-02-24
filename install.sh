BASH_PROFILE=".bash_profile"
CONFIG_FOLDER="Configurations"
mkdir $HOME/$CONFIG_FOLDER

touch $HOME/.bash_aliases
mv $HOME/.bash_aliases $HOME/$BASH_PROFILE
echo 'export CONFIG_FOLDER=$HOME/Configurations' >> $HOME/$BASH_PROFILE
echo 'alias restart=source $HOME/.bashrc' >> $HOME/$BASH_PROFILE

# Config files
git clone git@github.com:Sharu95/config.git $HOME/$CONFIG_FOLDER/config
cat $HOME/$CONFIG_FOLDER/config/scripts/start_env.sh >> $HOME/$BASH_PROFILE
cp $HOME/$CONFIG_FOLDER/config/.vimrc $HOME/.vimrc

# Git-radar
git clone git@github.com:michaeldfallen/git-radar.git $HOME/$CONFIG_FOLDER/git-radar
echo 'export PATH=$PATH:$CONFIG_FOLDER/git-radar'
echo 'LAMBDA="\[\033\]\[[38;5;208m\]λ\[\033\]\[[0m\]"' >> $HOME/$BASH_PROFILE
echo 'export PS1="$LAMBDA\$(git-radar --bash --fetch) "'

# Z jumping
git clone git@github.com:rupa/z.git $HOME/$CONFIG_FOLDER/z
echo '. $CONFIG_FOLDER/z/z.sh' >> $HOME/BASH_PROFILE

# Ubuntu theme and tweak tools
sudo apt update
sudo apt install gnome-tweak-tool
sudo apt install oranchelo-icon-theme
sudo apt install gnome-sushi