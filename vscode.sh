#!/bin/zsh

cd ~/Downloads

# Baixar o arquivo .tar.gz do VSCode
wget -O code-stable-x64.tar.gz "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"

# Extrair o arquivo tar.gz
tar -xvf code-stable-x64.tar.gz

# Criar o diretório ~/vscode se não existir
if [ ! -d "$OLDPWD/vscode" ]; then
    mkdir "$OLDPWD/vscode"
fi

# Definir o caminho para o binário do VSCode
VSCODESRC="$OLDPWD/vscode/bin/"

# Criando variavel de ambiente com o path do vscode
export VSCODESRC

# Copiar os arquivos extraídos para o diretório ~/vscode
cp -rvfd VSCode-linux-x64/* "$OLDPWD/vscode/"

# Remover os arquivos extraídos e o arquivo .tar.gz
rm -r code-stable-x64.tar.gz VSCode-linux-x64
