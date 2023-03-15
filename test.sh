#!/bin/bash

# Main



cur_dtg=$(date +%m-%d-%Y-%T)
mkdir /var/log/backups
gzip -k /var/log/$log_file
mv /var/log/$log_file.gz /var/log/backups/$log_file-$cur_dtg.gz

# End