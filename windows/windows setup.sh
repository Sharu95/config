# Install WSL
wsl --install

# Windows applications
winget install Microsoft.VisualStudioCode Docker.DockerDesktop Bruno.Bruno Postman.Postman HTTPie.HTTPie SlackTechnologies.Slack BlastApps.FluentSearch

code --install-extension ms-vscode-remote.remote-wsl # Install WSL extension in VS code to do WSL things like settings etc (in Win env)

# Download firacode
https://github.com/ryanoasis/nerd-fonts/releases/


# In WSL:
sudo apt update
sudo apt install xclip
sudo apt install zsh
sudo apt install lsd
sudo apt install httpie
sudo apt install build-essential
sudo apt install lzma unzip
sudo apt install jq
sudo apt install fzf
sudo apt install gh
sudo apt install ruby-dev
sudo apt install eza
sudo apt install bzip2 libssl-dev libncurses5-dev libncursesw5-dev lzma libffi-dev sqlite3 libsqlite3-dev # ASDF install deps on some things like python
sudo apt install golang-go # Initially for ASDF
sudo snap install onefetch

# Set default editor in WSL
sudo update-alternatives --config editor

# Run shell/1_init_install.sh
# Run shell/5_init_shell.sh

# Download ASDF
# 1. Clone repo, run make, add ASDF executable to path
git clone https://github.com/asdf-vm/asdf.git $HOME/asdf

# Run shell/3_init_asdf.sh and
# asdf completion zsh > $ZSH_CUSTOM/completions/_asdf




