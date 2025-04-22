#!/bin/zsh

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin dest=$HOME/kitty

if ! grep -q "alias kitty=" ~/.zshrc; then
	echo 'alias kitty="setsid $HOME/kitty/kitty.app/bin/kitty >/dev/null 2>&1 < /dev/null &"' >> ~/.zshrc
fi

source ~/.zshrc

mkdir -p ~/.config/kitty

cd ~/.config/kitty

cat > ~/.config/kitty/kitty.conf << EOL
# DeepSeek-inspired Kitty Terminal Theme
foreground              #e0e0e0
background              #1a1a2a
selection_foreground    #ffffff
selection_background    #3a3a5a

# Black
color0                  #1a1a2a
color8                  #4a4a6a

# Red
color1                  #ff6e6e
color9                  #ff9e9e

# Green
color2                  #5dffa8
color10                 #8dffc8

# Yellow
color3                  #ffcc66
color11                 #ffe699

# Blue
color4                  #6ea3ff
color12                 #9ec3ff

# Magenta
color5                  #c97fff
color13                 #e0a3ff

# Cyan
color6                  #66d9ff
color14                 #99e6ff

# White
color7                  #e0e0e0
color15                 #ffffff

# Cursor & UI
cursor                  #6ea3ff
cursor_text_color       #1a1a2a
url_color               #6ea3ff

# Tab bar
active_tab_foreground   #1a1a2a
active_tab_background   #6ea3ff
inactive_tab_foreground #a0a0c0
inactive_tab_background #2a2a3a
EOL

cat > ~/.local/share/applications/kitty.desktop << EOL
[Desktop Entry]
Name=Kitty Terminal
Comment=Fast, feature-rich, GPU based terminal
Exec=setsid /home/rde-fari/sgoinfre/kitty/kitty.app/bin/kitty
Icon=~/.config/kitty/'NyanDonut - Imgur.png'
Type=Application
Categories=System;TerminalEmulator;
StartupNotify=false
Terminal=false
EOL

chmod +x ~/.local/share/applications/kitty.desktop

cd ~/Downloads

wget -O code-stable-x64.tar.gz "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"

tar -xvf code-stable-x64.tar.gz

if [ ! -d "$HOME/vscode" ]; then
    mkdir "$HOME/vscode"
fi

cp -rvfd VSCode-linux-x64/* "$HOME/vscode/"

rm -r code-stable-x64.tar.gz VSCode-linux-x64

clear

echo ""
echo "╔════════════════════════════════════════════════════╗"
echo "║               📁 Every thing done!                 ║"
echo "╠════════════════════════════════════════════════════╣"
echo "║  🟢 All set, run source ~/.zshrc!                  ║"
echo "║  ✔️  Alias added!                                  ║"
echo "║  ✔️  Vscode installed! Run "code"                    ║"
echo "║  ✔️  Kitty terminal installed! Run "kitty"           ║"
echo "║                                                    ║"
echo "║  Please leave a star on github repository! Ty! ❤️  ║"
echo "╚════════════════════════════════════════════════════╝"