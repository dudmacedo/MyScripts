#!/bin/bash

# Template para facilitar a criação de scripts para conversão de vídeos com FFMPEG no Linux
# 
# Para uso deste script, é necessária a instalação do ffmpeg na máquina executora
# 
# Para vídeo:
# 
# * codec H264 - $H264
# * codec H265 - $H265
# * tamanho do vídeo   960x540 -  $R540P
# * tamanho do vídeo  1280x720 -  $R720P
# * tamanho do vídeo 1920x1080 - $R1080P
# 
# Para áudio:
# 
# * codec AC3 para todos os áudios - $AC3A
# * codec AC3 para o stream 0 - $AC30
# * codec AC3 para o stream 1 - $AC31
# * codec MP3 para todos os áudios - $MP3A
# * codec MP3 para o stream 0 - $MP30
# * codec MP3 para o stream 1 - $MP31
# * bitrate 128kbit para todos os streams - $B128KA
# * bitrate 192kbit para todos os streams - $B192KA
# * bitrate 256kbit para todos os streams - $B256KA
# * bitrate 384kbit para todos os streams - $B384KA
# * bitrate 640kbit para todos os streams - $B640KA
# * bitrate 128kbit para o stream 0 - $B128K0
# * bitrate 128kbit para o stream 1 - $B128K1
# * bitrate 192kbit para o stream 0 - $B192K0
# * bitrate 192kbit para o stream 1 - $B192K1
# * bitrate 256kbit para o stream 0 - $B256K0
# * bitrate 256kbit para o stream 1 - $B256K1
# * bitrate 384kbit para o stream 0 - $B384K0
# * bitrate 384kbit para o stream 1 - $B384K1
# * bitrate 640kbit para o stream 0 - $B640K0
# * bitrate 640kbit para o stream 1 - $B640K1

# Aumenta buffer para evitar erro "Conversion failed! by Too many packets buffered for output stream..."
MAXBUFFER="-max_muxing_queue_size 9999"

# Vídeo H264
H264="-c:v libx264"
# Vídeo H265
H265="-c:v libx265 -x265-params crf=24:qcomp=0.8:aq-mode=1:aq_strength=1.0:qg-size=16:psy-rd=0.7:psy-rdoq=5.0:rdoq-level=1:merange=44"
# Tamanho do vídeo   960x540
R540P="-s 960x540"
# Tamanho do vídeo  1280x720
R720P="-s 1280x720"
# Tamanho do vídeo 1920x1080
R1080P="-s 1920x1080"

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

# Bitrate 128kbps para todos os streams de áudio
B128KA="-b:a 128k"
# Bitrate 192kbps para todos os streams de áudio
B192KA="-b:a 192k"
# Bitrate 256kbps para todos os streams de áudio
B256KA="-b:a 256k"
# Bitrate 384kbps para todos os streams de áudio
B384KA="-b:a 384k"
# Bitrate 640kbps para todos os streams de áudio
B640KA="-b:a 640k"

# Bitrate 128kbps para o stream de áudio 0
B128K0="-b:a:0 128k"
# Bitrate 192kbps para o stream de áudio 0
B192K0="-b:a:0 192k"
# Bitrate 256kbps para o stream de áudio 0
B256K0="-b:a:0 256k"
# Bitrate 384kbps para o stream de áudio 0
B384K0="-b:a:0 384k"
# Bitrate 640kbps para o stream de áudio 0
B640K0="-b:a:0 640k"

# Bitrate 128kbps para o stream de áudio 1
B128K1="-b:a:1 128k"
# Bitrate 192kbps para o stream de áudio 1
B192K1="-b:a:1 192k"
# Bitrate 256kbps para o stream de áudio 1
B256K1="-b:a:1 256k"
# Bitrate 384kbps para o stream de áudio 1
B384K1="-b:a:1 384k"
# Bitrate 640kbps para o stream de áudio 1
B640K1="-b:a:1 640k"








