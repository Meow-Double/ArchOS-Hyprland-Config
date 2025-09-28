#!/bin/bash

# Входной файл (CSS от pywal)
INPUT="$HOME/.cache/wal/colors.css"

# Выходной файл (GTK-стиль)
OUTPUT="$HOME/.config/waybar/colors-gtk.css"

# Очистка выходного файла
echo "/* GTK-compatible colors from pywal */" > "$OUTPUT"
echo "" >> "$OUTPUT"

# Извлечение и преобразование
grep -E '^\s*--(background|foreground|cursor|color[0-9]+):' "$INPUT" | while read -r line; do
    # Удаление лишнего
    clean=$(echo "$line" | sed -E 's/--([^:]+):\s*([^;]+);/@define-color \1 \2;/')
    echo "$clean" >> "$OUTPUT"
done

echo "✅ GTK-цвета сохранены в $OUTPUT"
