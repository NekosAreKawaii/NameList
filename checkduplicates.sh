#!/bin/bash

# Pfade zur Datei "usernames" anpassen
FILE_PATH="usernames"

# Überprüfe, ob doppelte Zeilen vorhanden sind
DUPLICATE_LINES=$(sort -f "$FILE_PATH" | uniq -id)

if [ "$DUPLICATE_LINES" ]; then
    echo "##### Duplicates discovered! #####"
    echo "$DUPLICATE_LINES"
    exit 1
else
    echo "No duplicates."
    exit 0
fi
