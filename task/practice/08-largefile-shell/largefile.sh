#!/bin/bash

# Directory to check
DIR="/var/log"

echo "Finding the largest file in $DIR ..."

# Find largest file (not directory), list with sizes, sort, get top 1
largest_file=$(find $DIR -type f -printf "%s %p\n" 2>/dev/null | sort -nr | head -1)

size=$(echo $largest_file | awk '{print $1}')
file=$(echo $largest_file | cut -d' ' -f2-)

echo "Largest file: $file"
echo "Size: $size bytes"

