#!/bin/bash

# Путь к изображению
IMAGE="$HOME/Pictures/backgrounds/bg-4.png"

# 1. Установи обои (замени на свой способ)
swww img "$IMAGE"

# 2. Сгенерируй цвета через pywal 
wal -i "$IMAGE"

#3. Обновляем hyprland config

bash ~/MyScripts/hypr/hypr/hypr.sh

#6 Обновление cava
bash ~/MyScripts/hypr/cava/adaptedWalColors.sh && bash ~/MyScripts/hypr/cava/createConfig.sh && bash pkill -USR1 cava


# 4. Применение цветов в Kitty
kitty @ set-colors --all ~/.cache/wal/colors-kitty.conf



# 5. Обновление Waybar
# cp -r ~/.cache/wal/colors.css ~/.config/waybar/colors.css
bash ~/MyScripts/hypr/waybar-colors.sh
killall waybar && waybar &



# 6. Обновление Rofi (если используешь)
# cp ~/.cache/wal/colors-rofi-dark.rasi ~/.config/rofi/colors.rasi

echo "🎨 Цвета обновлены от $(basename ~/Wallpapers/current.jpg)"
