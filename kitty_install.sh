#!/bin/bash

echo "\n📦 A instalar o terminal Kitty..."

# Instalar o Kitty localmente
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin dest=~/sgoinfre/kitty

# Criar alias para o Kitty no .zshrc
if ! grep -q "alias kitty=" ~/.zshrc; then
    echo 'alias kitty="setsid /home/rde-fari/sgoinfre/kitty/kitty.app/bin/kitty >/dev/null 2>&1 < /dev/null &"' >> ~/.zshrc
    echo "✅ Alias 'kitty' criado com sucesso."
fi

# Atualizar o terminal atual com os novos aliases
echo "\n🔁 A carregar novo ambiente..."
source ~/.zshrc

echo "\n🚀 Kitty instalado com sucesso!"

# Criar o arquivo de configuração do Kitty com as configurações básicas
mkdir -p ~/.config/kitty
wget -O https://imgur.com/a/nyandonut-F6XTGaU > ~/.config/kitty/
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

# Criar o lançador do Kitty na barra de tarefas
echo "\n📑 Criando atalho do Kitty no menu de aplicações..."

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

# Adicionar permissões de execução ao atalho
chmod +x ~/.local/share/applications/kitty.desktop

clear
echo "\n🎉 Ambiente pronto! Usa 'kitty' para o terminal personalizado e encontra o atalho do Kitty no menu de aplicações."
echo "\n👾 Enter \"~/.local/share/applications/kitty.desktop\" to change the kitty terminal icon."
