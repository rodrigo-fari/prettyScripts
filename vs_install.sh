#!/bin/zsh

# Go to the downloads folder
cd ~/Downloads

# Download and extract vscode 
wget -O code-stable-x64.tar.gz "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
tar -xvf code-stable-x64.tar.gz

# Create vscode directory
if [ ! -d "$OLDPWD/vscode" ]; then
    mkdir "$OLDPWD/vscode"
fi

# Create path to execute vscode later on
VSCODESRC="$OLDPWD/vscode/bin/"

export VSCODESRC

# Copy the extracted files to vscode folder
cp -rvfd VSCode-linux-x64/* "$OLDPWD/vscode/"

# Remove the downloaded files
rm -r code-stable-x64.tar.gz VSCode-linux-x64

clear

echo "vscode downloaded and installed successfully!"
echo ""
echo "Use code to open vscode on your directory!"