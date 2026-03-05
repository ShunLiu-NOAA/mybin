#!/bin/bash

for f in ./*.def; do
  awk '
    $1=="clock" && $2=="real" && $NF=="-03:00" {
      print "  clock real 17.06.2025 15:00 -03:00"
      next
    }
    { print }
  ' "$f" > "${f}.tmp" && mv "${f}.tmp" "$f" && echo "Updated $f"
done
