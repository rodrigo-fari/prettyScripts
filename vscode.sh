#!/bin/bash

# Função para instalar VSCode
install_vscode() {
	cd ~/Downloads || exit

	wget -O code-stable-x64.tar.gz "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"

	tar -xvf code-stable-x64.tar.gz

	if [ ! -d "$HOME/sgoinfre/vscode" ]; then
		mkdir -p "$HOME/sgoinfre/vscode"
	fi

	echo "alias code='$HOME/sgoinfre/vscode/bin/code'" >> "$HOME/.zshrc"

	cp -rvfd VSCode-linux-x64/* "$HOME/sgoinfre/vscode"

	rm -rf code-stable-x64.tar.gz VSCode-linux-x64

	zenity --info --title="Installation Complete" --text="Visual Studio Code was successfully installed!"
}

# Função para desinstalar VSCode
uninstall_vscode() {
	INSTALL_DIR="$HOME/sgoinfre/vscode"

	if [ -d "$INSTALL_DIR" ]; then
		rm -rf "$INSTALL_DIR"
	fi

	sed -i "/alias code='\$HOME\/sgoinfre\/vscode\/bin\/code'/d" "$HOME/.zshrc"

	rm -f ~/Downloads/code-stable-x64.tar.gz
	rm -rf ~/Downloads/VSCode-linux-x64

	zenity --info --title="Uninstallation Complete" --text="Visual Studio Code was successfully removed!"
}

# Menu com radiolist (checkbox de seleção única)
choice=$(zenity --list \
  --title="VSCode Manager" \
  --text="Choose one action:" \
  --radiolist \
  --column="Select" --column="Action" \
  TRUE "Install VSCode" FALSE "Uninstall VSCode" \
  --width=300 --height=220)

case "$choice" in
	"Install VSCode")
		install_vscode
		;;
	"Uninstall VSCode")
		uninstall_vscode
		;;
	*)
		zenity --warning --title="No Action" --text="No option was selected. Exiting."
		;;
esac
