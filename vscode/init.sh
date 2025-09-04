install_extensions() {
	while read ext; do
		code --install-extension $ext
	done < extensions.txt
}

copy_settings() {
	VS_SETTINGS=""

	if [[ $1 == "linux" ]]; then
		VS_SETTINGS="$HOME/.config/Code/User"
	elif [[ $1 == "mac" ]]; then
		VS_SETTINGS="$HOME/Library/Application Support/Code/User"
	elif [[ $1 == "win" ]]; then  
		# WSL path 
		VS_SETTINGS="$HOME/.vscode-server/data/User"
	else 
		echo "$fg_bold[red]| Specify system for settings path <mac | linux | win>$reset_color"
		exit
	fi
	cp settings.json $VS_SETTINGS/settings.json
	if [[ $1 == "win" ]]; then
		cp keybindings_win.json $VS_SETTINGS/keybindings.json
	else
		cp keybindings.json $VS_SETTINGS/keybindings.json
	fi
}

echo "$fg_bold[yellow]| Installing extensions$reset_color"
install_extensions
echo "$fg_bold[yellow]| Copying settings$reset_color"
copy_settings $1




