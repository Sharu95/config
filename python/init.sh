echo "$fg_bold[yellow]| Setting up python env$reset_color"
pyenv install 3.8.10
pyenv global 3.8.10
pip install -r requirements.txt