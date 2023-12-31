####################################################################################   
#                                                                                  #
#   Creator: Thiago Nascimento                                                     #
#   Date: 10/24/2023                                                               #
#   last Update:                                                                   #
#                                                                                  #
#   Description:                                                                   #
#   This sript was created to delete arquives per creation date and name.          #
#                                                                                  #
#   Case:                                                                          # 
#   The objective is to exclude files with modification data that are more than    #
#   5 days old and that contain the name "Database".                               #
#                                                                                  #
####################################################################################
#!/bin/bash

# Especify directory to find
directory="/mnt/databases"

#Log file
log_file="/var/log/delete_db.log"

#Find variable
old_files=$(find "$directory" -maxdepth 1 -name 'Database*' -type f -mtime +5)

# Loop for delete
for files in $old_files; do
    rm -f "$files"
    echo "Arquivo $files removido." >> "$log_file"
done
