#!/bin/bash

# Tamanho do terminal
cols=$(tput cols)
rows=$(tput lines)

# Função para gerar "chuva" de caracteres
function rain() {
  chars=(ｱ ｲ ｳ ｴ ｵ ｶ ｷ ｸ ｹ ｺ ｻ ｼ ｽ ﾀ ﾁ ﾂ ﾃ ﾄ ﾅ ﾆ ﾇ ﾈ ﾉ ﾊ ﾋ ﾌ ﾍ ﾎ ﾏ ﾐ ﾑ ﾒ ﾓ ﾔ ﾕ ﾖ ﾗ ﾘ ﾙ ﾚ ﾛ ﾜ ﾝ)
  while true; do
    for ((i=0; i<$cols; i++)); do
      rand_char=${chars[$RANDOM % ${#chars[@]}]}
      rand_row=$((RANDOM % rows))
      tput setaf 2
      tput cup $rand_row $i
      echo -n "$rand_char"
    done
    sleep 0.02
  done
}

# Exibe "WAKE UP" no centro da tela
function wake_up_msg() {
  msg="WAKE UP"
  col_center=$(( (cols - ${#msg}) / 2 ))
  row_center=$(( rows / 2 ))

  for i in {1..5}; do
    tput setaf $((RANDOM % 7 + 1))
    tput bold
    tput cup $row_center $col_center
    echo "$msg"
    sleep 0.4
    tput cup $row_center $col_center
    echo "       " # Apaga
    sleep 0.1
  done

  # Fixa mensagem ao final
  tput setaf 2
  tput bold
  tput cup $row_center $col_center
  echo "$msg"
}

# Limpa e esconde cursor
clear
tput civis

# Roda a chuva em segundo plano
rain &
RAIN_PID=$!

# Roda a mensagem no centro
wake_up_msg

# Para a chuva
kill $RAIN_PID
wait $RAIN_PID 2>/dev/null

# Mostra o cursor novamente
	tput cnorm
clear

