#!/bin/bash

FILE_PATH="usernames"

EXCLUSION_LIST=("xX" "Xx")

DUPLICATE_LINES=$(sort "$FILE_PATH" | uniq -d)

# loop through the duplicates and remove them 
FILTERED_DUPLICATES=""
for DUPLICATE in $DUPLICATE_LINES; do
    if [[ ! " ${EXCLUSION_LIST[@]} " =~ " $DUPLICATE " ]]; then
        FILTERED_DUPLICATES="$FILTERED_DUPLICATES$DUPLICATE\n"
    fi
done

if [ "$FILTERED_DUPLICATES" ]; then
    echo -e "##### Duplicates discovered! #####\n$FILTERED_DUPLICATES"
    exit 1
else
    echo "No duplicates."
    exit 0
fi
