#!/bin/bash
# Simple Automated System Config Backup Script

BACKUP_DIR="/var/backups/sys_configs"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/etc_backup_$DATE.tar.gz" /etc/

echo "Backup completed successfully on $(date)"
