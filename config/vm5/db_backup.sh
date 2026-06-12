#!/bin/bash
DB_NAME="db_gamenet"
BACKUP_DIR="/var/backups/gamenet/db"
FECHA=$(date +%Y%m%d_%H%M)

mkdir -p "$BACKUP_DIR"

mysqldump -u root -pGamenet2026! --databases "$DB_NAME" \
    | gzip > "$BACKUP_DIR/$DB_NAME-$FECHA.sql.gz"

if [ $? -eq 0 ]; then
    echo "[OK] Backup: $BACKUP_DIR/$DB_NAME-$FECHA.sql.gz"
else
    echo "[ERROR] Fallo el backup."
    exit 1
fi

find "$BACKUP_DIR" -name "*.sql.gz" -mtime +7 -delete
echo "[OK] Rotacion completada."
