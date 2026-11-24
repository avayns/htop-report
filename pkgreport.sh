#!/bin/bash
# Использование: ./pkgreport.sh git   ->  создаст git.md в текущей папке
set -e

PKG="$1"
if [ -z "$PKG" ]; then
    echo "Использование: $0 <имя_пакета>"
    exit 1
fi

for t in figlet tree dpkg-deb apt-get apt; do
    command -v "$t" >/dev/null 2>&1 || {
        echo "Не найдена утилита $t. Поставьте: sudo apt install figlet tree"
        exit 1
    }
done

START_DIR="$(pwd)"
OUT="$START_DIR/$PKG.md"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

# 1. Скачиваем deb и распаковываем
cd "$WORK"
if ! apt-get download "$PKG" >/dev/null 2>&1; then
    echo "Не удалось скачать пакет $PKG (проверьте имя и sudo apt update)"
    exit 1
fi
DEB="$(ls ./*.deb | head -n1)"
dpkg-deb -x "$DEB" root     # файлы пакета
dpkg-deb -e "$DEB" ctrl     # control, preinst, postinst, prerm, postrm

# 2. Генерируем markdown
{
    # ASCII-баннер
    echo '' 
    figlet -f banner "$PKG" 
    echo ''
    echo

    # apt show: двойной пробел в конце = перенос строки в markdown,
    # ключи выделяем жирным
    apt show "$PKG" 2>/dev/null \
        | sed 's/$/  /' \
        | sed -E 's/^([A-Za-z-]+:) /**\1** /'
    echo

    # Структура пакета
    echo '## Структура пакета'
    echo
    echo '```'
    (cd root && tree)
    echo '```'
    echo

    # Скрипты мейнтейнера
    for f in preinst postinst prerm postrm; do
        echo "## Файл $f"
        echo
        if [ -f "ctrl/$f" ]; then
            echo '```sh'
            cat "ctrl/$f"
            echo '```'
        else
            echo "_В пакете нет файла ${f}_"
        fi
        echo
    done
} > "$OUT"

echo "Готово: $OUT"
