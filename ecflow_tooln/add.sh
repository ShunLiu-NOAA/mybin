#!/bin/bash

#!/bin/bash

for hh in $(seq -w 00 23); do
  def_file="rrfs_cycled_${hh}.def"
  if [ -f "$def_file" ]; then
    sed -i "/^suite nco_rrfs_dev_${hh}$/a\\
  clock real 06.06.2025 00:00 -03:00
" "$def_file"
    echo "Updated $def_file"
  else
    echo "⚠️ File $def_file not found, skipping"
  fi
done

exit


# Path to your .def file
def_file="rrfs_cycled_00.def"
temp_file="${def_file}.tmp"

awk '{
  print $0
  if ($1 == "suite" && $2 == "nco_rrfs_dev_00") {
    print "  clock real 06.06.2025 00:00 -03:00"
  }
}' "$def_file" > "$temp_file" && mv "$temp_file" "$def_file"

