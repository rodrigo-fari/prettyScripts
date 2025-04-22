#!/bin/zsh

cd ~/Downloads

wget -O code-stable-x64.tar.gz "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
# Extract the tar.gz file
tar -xvf code-stable-x64.tar.gz

# Create the ~/vscode directory if it doesn't exist
if [ ! -d ~/sgoinfre/vscode ]; then
	mkdir ~/sgoinfre/vscode
fi

# Copy the contents to the ~/vscode directory
cp -rvfd VSCode-linux-x64/* ~/sgoinfre/vscode/

# Remove the extracted directory and the tar.gz file
rm -r code-stable-x64.tar.gz VSCode-linux-x64
