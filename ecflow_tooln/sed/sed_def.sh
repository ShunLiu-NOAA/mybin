#!/bin/bash

# Define the base directory for the definition files
DEF_DIR="/lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow/ecf/defs"

# Change to the directory where the files are located
cd "$DEF_DIR" || { echo "Error: Could not change to directory $DEF_DIR"; exit 1; }

echo "Starting to process rrfs_cycled_00.def to rrfs_cycled_23.def..."

# Loop from 0 to 23
for i in $(seq -w 01 23); do
    FILE="rrfs_cycled_${i}.def"

    if [ -f "$FILE" ]; then
        echo "----------------------------------------------------"
        echo "Processing file: $FILE"

        # Create a backup of the original file
        cp "${FILE}.bak" "$FILE"
        cp "$FILE" "${FILE}.bak"
        echo "Backup created: ${FILE}.bak"

        echo "Applying changes to $FILE..."

        sed -i \
            -e 's#edit OUTPUTDIR '\''/lfs/h3/emc/eib/noscrub/ptmp/%EMC_USER%/ecflow_rrfs/para/output/prod/today'\''#edit OUTPUTDIR '\''/lfs/f2/t2o/ptmp/emc/Shun.Liu/output/prod/today'\''#g' \
            -e 's#edit QUEUE '\''devhigh'\''#edit QUEUE '\''devhigh'\''#g' \
            -e 's#edit PACKAGEHOME '\''/lfs/h2/emc/lam/noscrub/%EMC_USER%/rrfs/para/packages/rrfs.%rrfs_ver%'\''#edit PACKAGEHOME '\''/lfs/f2/t2o/ptmp/emc/Shun.Liu/rrfs/rrfs-workflow'\''#g' \
            -e 's#edit nco_rrfs#edit emc_rrfs#g' \
            "$FILE"

        echo "Changes applied successfully to $FILE."
    else
        echo "----------------------------------------------------"
        echo "Warning: File not found: $FILE. Skipping."
    fi
done

echo "----------------------------------------------------"
echo "All specified rrfs_cycled_*.def files processed."

exit
