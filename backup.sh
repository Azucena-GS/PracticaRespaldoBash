#!/bin/bash

DB_USER="root"
DB_PASSWORD="tu_password"
DB_NAME="mi_base"
BACKUP_DIR="$HOME/backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

mkdir -p "$BACKUP_DIR"

echo "Iniciando respaldo..."

mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > "$BACKUP_DIR/$DB_NAME-$DATE.sql"

gzip "$BACKUP_DIR/$DB_NAME-$DATE.sql"

find "$BACKUP_DIR" -type f -name "*.gz" -mtime +7 -exec rm {} \;

echo "Respaldo completado"
