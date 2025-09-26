# Install WSL
wsl --install

# Windows applications
winget install Microsoft.VisualStudioCode
winget install httpie
code --install-extension ms-vscode-remote.remote-wsl # Install WSL extension in VS code to do WSL things like settings etc (in Win env)

# In WSL:
sudo apt update 
sudo apt install zsh
sudo apt install lsd
sudo apt install httpie
sudo apt install build-essential
sudo apt install lzma unzip
sudo apt install jq

# Download firacode
https://github.com/ryanoasis/nerd-fonts/releases/