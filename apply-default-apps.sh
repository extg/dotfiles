#!/usr/bin/env bash

# Script to apply default application settings from an export file
# Usage: ./apply-default-apps.sh [input_file]

INPUT_FILE=${1:-"default-apps.txt"}

if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: Input file $INPUT_FILE not found."
  exit 1
fi

# Check if duti is installed
if ! command -v duti &> /dev/null; then
  echo "Error: duti is not installed. Please install with 'brew install duti'"
  exit 1
fi

echo "Applying default application settings from $INPUT_FILE..."

# Read the input file and apply settings
while IFS= read -r line
do
  # Skip comments and empty lines
  if [[ "$line" == \#* ]] || [[ -z "$line" ]]; then
    continue
  fi
  
  # Parse the line
  read -r bundle_id type_or_scheme role <<< "$line"
  
  # Check if this is a URL scheme (has no 'role' field)
  if [ -z "$role" ]; then
    echo "Setting $bundle_id as handler for $type_or_scheme URL scheme"
    duti -s "$bundle_id" "$type_or_scheme"
  else
    echo "Setting $bundle_id as $role handler for $type_or_scheme"
    duti -s "$bundle_id" "$type_or_scheme" "$role"
  fi
done < "$INPUT_FILE"

echo "Default application settings applied successfully." 
