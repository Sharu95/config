if [ "$1" != "mac" ] && [ "$1" != "win" ]; then
    echo "Usage: $0 [mac|win]"
    exit 1
fi

if [ "$1" = "mac" ]; then
    # Install homebrew
    echo "| Installing $fg_bold[yellow]Homebrew$reset_color"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval $(/opt/homebrew/bin/brew shellenv)

    # Install tmux plugin manager
    echo "| Installing $fg_bold[yellow]TMUX plugin manager$reset_color"
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

# Install Oh my Zsh
echo "| Installing $fg_bold[yellow]Oh My Zsh$reset_color"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

FOLDERS=(".config/custom/")
for f in ${FOLDERS[@]}
do 
    echo "| Creating folder $fg_bold[yellow]$HOME/$f$reset_color"
    mkdir -p "$HOME/$f"
done

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/autoswitch_virtualenv
git clone https://github.com/hsaunders1904/pyautoenv ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/pyautoenv
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/you-should-use
source "$HOME/.zshrc"



##### LINUX Ubuntu theme and tweak tools
#sudo apt update
#sudo apt install gnome-tweak-tool
#sudo apt install oranchelo-icon-theme
#sudo apt install gnome-sushi
