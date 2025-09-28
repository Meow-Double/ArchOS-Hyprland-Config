#!/bin/bash

# Путь к файлу с цветами
color_file="$HOME/MyScripts/hypr/cava/colors.conf"

# Считываем цвета из файла
background=$(grep '^background=' "$color_file" | cut -d'=' -f2)
foreground=$(grep '^foreground=' "$color_file" | cut -d'=' -f2)

gradient1=$(grep '^color1=' "$color_file" | cut -d'=' -f2)
gradient2=$(grep '^color2=' "$color_file" | cut -d'=' -f2)
gradient3=$(grep '^color3=' "$color_file" | cut -d'=' -f2)
gradient4=$(grep '^color4=' "$color_file" | cut -d'=' -f2)
gradient5=$(grep '^color5=' "$color_file" | cut -d'=' -f2)
gradient6=$(grep '^color6=' "$color_file" | cut -d'=' -f2)
gradient7=$(grep '^color7=' "$color_file" | cut -d'=' -f2)

# Генерируем конфиг
cat > ~/.config/cava/config <<EOF
[general]
framerate = 60
autosens = 1

[color]
foreground = "$foreground"
background = "$background"
gradient = 1
gradient_color_1 = "$gradient1"
gradient_color_2 = "$gradient2"
gradient_color_3 = "$gradient3"
gradient_color_4 = "$gradient4"
gradient_color_5 = "$gradient5"
gradient_color_6 = "$gradient6"
gradient_color_7 = "$gradient7"
EOF
