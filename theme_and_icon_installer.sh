#!/bin/bash

# -----------------------------------------------
# Midnight-Green Theme + Icons Installer
# -----------------------------------------------
# Automates:
# 1. Install Midnight-Green (GTK + Shell)
# 2. Install Tela-green icons
# 3. Apply themes/icons
# -----------------------------------------------

echo "Starting installation..."

# Create themes/icons directories if missing
mkdir -p ~/.themes ~/.icons

# Download and install Midnight-Green theme
echo "Installing Midnight-Green theme..."
if [ ! -d ~/.themes/Midnight-Green ]; then
  wget https://github.com/vinceliuice/Midnight-Green-theme/archive/master.zip -O /tmp/Midnight-Green.zip
  unzip -q /tmp/Midnight-Green.zip -d /tmp/
  mv /tmp/Midnight-Green-theme-master ~/.themes/Midnight-Green
  rm /tmp/Midnight-Green.zip
else
  echo "Midnight-Green theme already exists. Skipping download."
fi

# Download and install Tela-green icons
echo "Installing Tela-green icons..."
if [ ! -d ~/.local/share/icons/Tela-green ]; then
  wget https://github.com/vinceliuice/Tela-icon-theme/archive/master.zip -O /tmp/Tela-icons.zip
  unzip -q /tmp/Tela-icons.zip -d /tmp/
  cd /tmp/Tela-icon-theme-master
  ./install.sh -a
  cd ~
  rm -rf /tmp/Tela-icon-theme-master /tmp/Tela-icons.zip
else
  echo "Tela icons already installed. Skipping download."
fi

# Apply themes
echo "Applying themes..."
gsettings set org.gnome.desktop.interface gtk-theme "Midnight-Green"
gsettings set org.gnome.shell.extensions.user-theme name "Midnight-Green"
gsettings set org.gnome.desktop.interface icon-theme "Tela-green"

# Enable User Themes extension (for Shell theme)
if ! gnome-extensions list | grep -q "user-theme@gnome-shell-extensions.gcampax.github.com"; then
  gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
fi

# Refresh icon cache
echo "Refreshing icon cache..."
gtk-update-icon-cache

echo "Done! Log out and back in to see changes."
