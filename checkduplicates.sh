#!/bin/bash

# Pfade zur Datei "usernames" anpassen
FILE_PATH="usernames"

# Überprüfe, ob doppelte Zeilen vorhanden sind
DUPLICATE_LINES=$(sort "$FILE_PATH" | uniq -d)

if [ "$DUPLICATE_LINES" ]; then
    echo "##### Duplicates discovered! #####"
    echo "$DUPLICATE_LINES"
    exit 1
else
    echo "No duplicates."
    exit 0
fi
