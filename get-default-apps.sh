#!/usr/bin/env bash

# Script to export current default app associations to a file
# Usage: ./get-default-apps.sh [output_file]

OUTPUT_FILE=${1:-"default-apps.txt"}

# Get all UTIs with their handlers
echo "# Default application settings exported on $(date)" > "$OUTPUT_FILE"
echo "# Format: UTI bundleID role" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Get file extension handlers
echo "# File extension handlers" >> "$OUTPUT_FILE"

# Common file extensions to check
extensions=("txt" "pdf" "jpg" "png" "mp4" "mp3" "doc" "docx" "xls" "xlsx" "ppt" "pptx" "html" "css" "js" "jsx" "ts" "tsx" "json" "xml" "zip" "tar" "gz" "csv" "svg" "gif" "webp" "mov" "avi" "mkv" "wav" "m4a" "flac" "ogg" "rtf" "md" "py" "rb" "sh" "java" "c" "cpp" "h" "go" "php" "sql" "conf" "ini" "yaml" "yml" "toml" "psd" "ai" "eps" "tiff" "bmp" "rar" "7z" "ico")

# For each extension, get its default handler
for ext in "${extensions[@]}"; do
  handler=$(duti -x "$ext" 2>/dev/null | grep -v "^$" | head -1)
  if [ -n "$handler" ]; then
    bundle_id=$(duti -x "$ext" 2>/dev/null | grep -v "^$" | tail -1)
    if [ -n "$bundle_id" ]; then
      echo "$bundle_id .$ext all" >> "$OUTPUT_FILE"
    fi
  fi
done

echo "Default applications export completed. Results saved to $OUTPUT_FILE" 
