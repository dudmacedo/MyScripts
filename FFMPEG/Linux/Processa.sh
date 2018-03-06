#!/bin/bash

# Template para facilitar a criação de scripts para conversão de vídeos com FFMPEG no Linux
# 
# Para uso deste script, é necessária a instalação do ffmpeg na máquina executora
# 
# Para vídeo:
# 
# * codec H264 - $H264
# * codec H265 - $H265
# 
# Para áudio:
# 
# codec AC3 para todos os áudios - $AC3A
# codec AC3 para o stream 0 - $AC30
# codec AC3 para o stream 1 - $AC31
# codec MP3 para todos os áudios - $MP3A
# codec MP3 para o stream 0 - $MP30
# codec MP3 para o stream 1 - $MP31
# bitrate 128kbit para todos os streams
# bitrate 192kbit para todos os streams
# bitrate 384kbit para todos os streams
# bitrate 640kbit para todos os streams
# bitrate 128kbit para o stream 0
# bitrate 128kbit para o stream 1
# bitrate 192kbit para o stream 0
# bitrate 192kbit para o stream 1
# bitrate 384kbit para o stream 0
# bitrate 384kbit para o stream 1
# bitrate 640kbit para o stream 0
# bitrate 640kbit para o stream 1

# Vídeo H264
H264="-c:v libx264"
# Vídeo H265
H265="-c:v libx265 -x265-params crf=24:qcomp=0.8:aq-mode=1:aq_strength=1.0:qg-size=16:psy-rd=0.7:psy-rdoq=5.0:rdoq-level=1:merange=44"

# Áudio AC3 para todos os streams de áudio
AC3A="-c:a ac3"
# Áudio AC3 para o stream 0
AC30="-c:a:0 ac3"
# Áudio AC3 para o stream 1
AC31="-c:a:1 ac3"

# Áudio MP3 para todos os streams de áudio
MP3A="-c:a mp3"
# Áudio MP3 para o stream 0
MP30="-c:a:0 mp3"
# Áudio MP3 para o stream 1
MP31="-c:a:1 mp3"

