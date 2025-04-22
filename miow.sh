#!/bin/zsh

if [ ! -d "~/.themes" ]; then
    mkdir "~/.themes"
fi

if [ ! -d "~/.icons" ]; then
    mkdir "~/.icons"
fi

if [ ! -d ~/.themes/Midnight-Green ]; then
  wget https://github.com/vinceliuice/Midnight-Green-theme/archive/master.zip -O /tmp/Midnight-Green.zip
  unzip -q /tmp/Midnight-Green.zip -d /tmp/
  mv /tmp/Midnight-Green-theme-master ~/.themes/Midnight-Green
  rm /tmp/Midnight-Green.zip
fi

if [ ! -d ~/.local/share/icons/Tela-green ]; then
  wget https://github.com/vinceliuice/Tela-icon-theme/archive/master.zip -O /tmp/Tela-icons.zip
  unzip -q /tmp/Tela-icons.zip -d /tmp/
  cd /tmp/Tela-icon-theme-master
  ./install.sh -a
  cd ~
  rm -rf /tmp/Tela-icon-theme-master /tmp/Tela-icons.zip
fi

gsettings set org.gnome.desktop.interface gtk-theme "Midnight-Green"
gsettings set org.gnome.shell.extensions.user-theme name "Midnight-Green"
gsettings set org.gnome.desktop.interface icon-theme "Tela-green"

if ! gnome-extensions list | grep -q "user-theme@gnome-shell-extensions.gcampax.github.com"; then
  gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
fi

gtk-update-icon-cache

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin dest=$HOME/MIOW/kitty

if ! grep -q "alias kitty=" ~/.zshrc; then
    echo 'alias kitty="setsid $HOME/MIOW/kitty/kitty.app/bin/kitty >/dev/null 2>&1 < /dev/null &"' >> ~/.zshrc
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

if [ ! -d "$HOME/MIOW/vscode" ]; then
    mkdir "$HOME/MIOW/vscode"
fi

echo "alias code='$HOME/MIOW/vscode/bin/code'" >> $HOME/.zshrc

cp -rvfd VSCode-linux-x64/* "$HOME/MIOW/vscode"

rm -r code-stable-x64.tar.gz VSCode-linux-x64

clear

echo ""
echo "╔════════════════════════════════════════════════════╗"
echo "║               📁 Every thing done!                 ║"
echo "╠════════════════════════════════════════════════════╣"
echo "║  🟢 All set, run source ~/.zshrc!                  ║"
echo "║                                                    ║"
echo "║  ✔️  Vscode installed! Run "code"                     ║"
echo "║  ✔️  Kitty terminal installed! Run "kitty"            ║"
echo "║  ✔️  Theme installed!                               ║"
echo "║                                                    ║"
echo "║  ⚙️  "config"      - Open .zshrc.                     ║"
echo "║  ⚙️  "restart"     - Restart your terminal.           ║"
echo "║  ⚙️  "kittyconfig" - Open Kitty settings              ║"
echo "║                                                    ║"
echo "║  Please leave a star on github repository! Ty! ❤️   ║"
echo "╚════════════════════════════════════════════════════╝"
