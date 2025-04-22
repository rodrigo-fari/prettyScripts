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
cat > ~/.config/kitty/kitty.conf << EOL
# Tema base
foreground #f8f8f2
background #1e1e2e
selection_background #44475a
selection_foreground #ffffff
cursor #ffcc00

# Cores da paleta
color0  #000000
color1  #ff5555
color2  #50fa7b
color3  #f1fa8c
color4  #bd93f9
color5  #ff79c6
color6  #8be9fd
color7  #bbbbbb
color8  #44475a
color9  #ff6e6e
color10 #69ff94
color11 #ffffa5
color12 #d6acff
color13 #ff92df
color14 #a4ffff
color15 #ffffff

# Fonte
font_family      JetBrainsMono Nerd Font
bold_font        auto
italic_font      auto
font_size        12.5

# Espaçamento
line_spacing     1
letter_spacing   0

# Transparência
background_opacity 0.9

# Comportamento
enable_audio_bell no
tab_bar_edge bottom
EOL

# Criar o lançador do Kitty na barra de tarefas
echo "\n📑 Criando atalho do Kitty no menu de aplicações..."

cat > ~/.local/share/applications/kitty.desktop << EOL
[Desktop Entry]
Name=Kitty Terminal
Comment=Fast, feature-rich, GPU based terminal
Exec=setsid /home/rde-fari/sgoinfre/kitty/kitty.app/bin/kitty
Icon=/home/rde-fari/sgoinfre/kitty/kitty.app/share/icons/hicolor/256x256/apps/kitty.png
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
