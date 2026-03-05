#!/bin/bash

for f in *.def; do
  awk '
    $1=="family" && $2=="rrfs" {
      print       # print the existing "family rrfs" line
      print "    trigger cycle_end == complete"  # insert trigger line
      next        # skip to next input line
    }
    { print }      # print all other lines as-is
  ' "$f" > "${f}.tmp" && mv "${f}.tmp" "$f" && echo "Updated $f"
done

