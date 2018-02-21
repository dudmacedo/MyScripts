#!/bin/bash

# Para encontrar os modos de tela disponíveis basta entrar o comando xrandr
# ~$ xrandr
# 
# O comando xrandr retornará os modos de forma semelhante como abaixo:
# 
# Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 8192 x 8192
# VGA1 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 0mm x 0mm
# 1920x1080_60.00 60.0*+ (*)
# 1440x900_60.00 59.9
# 1280x720_60.00 59.9
# 1024x768 60.0
# 1024x600_60.00 59.9
# 800x600 60.3 56.2
# 848x480 60.0
# 640x480 59.9
# 
# Para definir a resolução da tela, basta escolher um dos modos disponíveis e entrar o comando xrandr da seguinte forma:
# 
# $ xrandr -s 1440x900
# 
# -----------------------------------------------------------------------------------------------------------------------
# 
# Quando o xrandr não exibir o modo desejado, é necessário adicionar o modo manualmente, primeiramente é necessário
# entrar o comando cvt <comprimento> <altura> <framerate>, conforme exemplo abaixo:
# 
# $ cvt 1366 768 60
# 
# Este comando exibirá algo como:
# 
# # 1368x768 59.88 Hz (CVT) hsync: 47.79 kHz; pclk: 85.25 MHz
# Modeline "1368x768_60.00"   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync
# 
# Então este resultado poderá ser utilizado para criar o novo modo de vídeo, a ser feito com o comando 
# xrandr --newmode <linha após Modeline>:
# 
# $ xrandr --newmode "1368x768_60.00"   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync
# 
# Com o comando xrandr sem parâmetros são exibidos os monitores conectados e não conectados:
# 
# Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 8192 x 8192
# VGA1 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 0mm x 0mm
# 
# Após identificar a saída de vídeo que será alterada, pode-se adicionar o modo a esta saída:
# 
# $ xrandr --addmode VGA1 1368x768_60.00
# 
# E então definir o modo de vídeo:
# 
# $ xrandr --output VGA1 --mode 1368x768_60.00
# 
# Após tudo isso deve funcionar, mas após reiniciar o computador é necessário adicionar os modos novamente,
# por isso é recomendável incluir estes comandos ao script ~/.profile do usuário, e toda vez que for feito
# o logon, o modo de vídeo será definido automáticamente.
#
# ---------------------------------------------------------------------------------------------------------
# 
# Este script adiciona automaticamente os comandos ao ~/.profile e define a resolução

xrandr

read -p 'Informe a saída de vídeo desejada: ' OUTPUT

read -p 'Informe o modo de vídeo desejado <largura> <altura> <framerate>: ' MODO

NOVOMODO=$(cvt $MODO | sed -n '2p')
NOVOMODOSHRT=${NOVOMODO#*\"}
NOVOMODOSHRT=${NOVOMODOSHRT%\"*}

echo "xrandr --newmode $NOVOMODO
xrandr --addmode $OUTPUT $NOVOMODOSHRT
xrandr --output $OUTPUT --mode $NOVOMODOSHRT" > ~/.profile_setvideo.sh

chmod +x ~/.profile_setvideo.sh

echo "
~/.profile_setvideo.sh" >> ~/.profile

~/.profile_setvideo.sh
