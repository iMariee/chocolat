#!/bin/bash

CONTENT="$(cat coding-style-reports.log)"
ILLEGAL_FILES_FOUND=0
if [ "$CONTENT" == "" ]; then
    exit 0
fi
while IFS= read -r LINE; do
    FILE=$(echo $LINE | cut -d ':' -f 1)
    LINE_NUMBER=$(echo $LINE | cut -d ':' -f 2)
    LEVEL=$(echo $LINE | cut -d ':' -f 3 | cut -d ' ' -f 2)
    ERROR_CODE=$(echo $LINE | cut -d ':' -f 4)
    echo "::error file=$FILE,line=$LINE_NUMBER,title=$LEVEL coding style error::$ERROR_CODE"
    ILLEGAL_FILES_FOUND=1
done <<<"$CONTENT"
if [ $ILLEGAL_FILES_FOUND -eq 1 ]; then
    exit 1
else
    exit 0
fi
