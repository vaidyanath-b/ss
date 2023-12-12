#!/bin/bash

input_file="Indexed.c"

# Check if the file exists
if [ ! -f "$input_file" ]; then
  echo "Error: File not found."
  exit 1
fi

# Use awk to add 7 blank lines after every 3 lines
awk '{print} NR % 3 == 0 {for (i=0; i<7; i++) print ""}' "$input_file" > "${input_file}.tmp"

# Replace the original file with the modified one
mv "${input_file}.tmp" "$input_file"

echo "Script completed."
