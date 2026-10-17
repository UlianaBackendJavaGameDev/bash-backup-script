#!/bin/bash

#colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'
SOURCE_DIR="$HOME/bash-scripts"

BACKUP_DIR="$HOME/backups"
DATE=$(date +"%Y-%m-%d_%H:%M")
ARCHIVE_NAME="backup_$DATE.tar.gx"

if [ ! -d "$SOURCE_DIR" ]; then
	echo -e "${RED}Ошибка: папка $SOURCE_DIR не найдена!${NC}"
	exit 1
fi

if [ ! -d "$BACKUP_DIR" ]; then
	mkdir -p "$BACKUP_DIR"
	echo "Создана папка для бэкапов: $BACKUP_DIR"
fi

echo "Начинаю архивацию $SOURCE_DIR ...."

tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" -C "$(dirname "SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

if [ $? -eq 0 ]; then
	echo -e "${GREEN} Успех! Архив создан: $BACKUP_DIR/$ARCHIVE_NAME${NC}"
	ls -lh "$BACKUP_DIR/$ARCHIVE_NAME"
else
	echo -e "${RED} Ошибка при создании архива!${NC}"
	exit 1
fi
