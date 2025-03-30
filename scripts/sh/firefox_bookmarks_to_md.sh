#!/bin/bash
if [ $# -ne 1 ]; then
  echo "Usage: $0 <bookmarks_file>"
  exit 1
fi

BOOKMARKS_FILE=$1
OUTPUT_FILE="bookmarks_table.md"

echo "Converting $BOOKMARKS_FILE to markdown table..."

(
  echo "| URL | Description |"
  echo "| --- | ----------- |"
  cat "$BOOKMARKS_FILE" | grep -o '<A HREF="[^"]*".*</A>' | sed 's/<A HREF="\([^"]*\)"[^>]*>\(.*\)<\/A>/| \1 | \2 |/'
) > "$OUTPUT_FILE"

echo "Conversion complete. Output saved to $OUTPUT_FILE"