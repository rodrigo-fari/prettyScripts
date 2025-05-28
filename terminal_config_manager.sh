#!/bin/bash

BACKUP_FILE="$PWD/gnome-terminal-backup.txt"

CHOICE=$(zenity --list \
  --radiolist \
  --title="Terminal Configuration Manager" \
  --text="Choose one action:" \
  --column="Selected" --column="Action" \
  TRUE "Backup terminal configuration" \
  FALSE "Import terminal configuration" \
  --width=400 --height=250)

if [ $? -ne 0 ]; then
  exit 0
fi

case "$CHOICE" in
  "Backup terminal configuration")
    dconf dump /org/gnome/terminal/ > "$BACKUP_FILE"
    zenity --info --title="Success" --text="Backup completed and saved to:\n$BACKUP_FILE"
    ;;
  "Import terminal configuration")
    if [ -f "$BACKUP_FILE" ]; then
      dconf load /org/gnome/terminal/ < "$BACKUP_FILE"
      zenity --info --title="Success" --text="Configuration imported from:\n$BACKUP_FILE"
    else
      zenity --error --title="Error" --text="No backup file found at:\n$BACKUP_FILE"
    fi
    ;;
esac
