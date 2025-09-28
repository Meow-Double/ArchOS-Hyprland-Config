#!/bin/bash

CSS="$HOME/.cache/wal/colors.css"
TEMPLATE="$HOME/MyScripts/hypr/hypr/hyprland.template.conf"
OUTPUT="$HOME/.config/hypr/hyprland.conf"

# Проверка наличия файлов
[[ ! -f "$CSS" ]] && { echo "colors.css не найден: $CSS"; exit 1; }
[[ ! -f "$TEMPLATE" ]] && { echo "Шаблон не найден: $TEMPLATE"; exit 1; }

# Извлечение цветов из CSS без #
declare -A colors
while IFS= read -r line; do
  if [[ $line =~ --(color[0-9]+):\ #([0-9a-fA-F]{6}) ]]; then
    key="${BASH_REMATCH[1]}"
    value="${BASH_REMATCH[2]}"  # без #
    colors["$key"]="$value"
  fi
done < "$CSS"

# Копируем шаблон
cp "$TEMPLATE" "$OUTPUT"

# Заменяем %colorX% на HEX без #
for key in "${!colors[@]}"; do
  sed -i "s/%$key%/${colors[$key]}/g" "$OUTPUT"
done

echo "✅ hyprland.conf обновлён: цвета вставлены без #"
