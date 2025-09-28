#!/bin/bash

# Путь к CSS-файлу, сгенерированному pywal
css_file="$HOME/.cache/wal/colors.css"

# Путь к выходному конфигу
conf_file="$HOME/MyScripts/hypr/cava/colors.conf"

# Проверка наличия CSS-файла
if [[ ! -f "$css_file" ]]; then
  echo "Файл $css_file не найден. Убедись, что pywal был запущен."
  exit 1
fi

# Очистка выходного файла
> "$conf_file"

# Извлечение переменных и преобразование в формат key=value
grep --color=never -E '^\s*--' "$css_file" | while read -r line; do
  # Пример строки: --color0: #1d2021;
  key=$(echo "$line" | cut -d':' -f1 | tr -d ' ;' | sed 's/--//')
  value=$(echo "$line" | cut -d':' -f2 | tr -d ' ;')
  echo "$key=$value" >> "$conf_file"
done

echo "Цвета успешно сохранены в $conf_file"
