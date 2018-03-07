#!/bin/bash

source ./TemplateAVConvFFMPEG.sh

ffmpeg -i "Converter/in.avi" -map 0 -c copy $H265 $R720P $AC3A $B256K0 $B640K0 "Convertido/out.mkv"
