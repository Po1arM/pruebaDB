#!/bin/bash

# 1 to 7
DATE=$(date + %d-%m-%Y-T)

# database username
USER="root"
# database user's password

# the directory to save the dumped .sql files
DUMP_DIR="/var/local/backups"

# list of databases to dump
DATABASE="data" 

# where to sync in S3
S3_SYNC_URL="s3://pruebabucketrtyui/mysql/"

# loop through each database and dump
    echo "Dumping database: $DATABASE"
    # dump the database
    # filename ~= /var/local/backups/database_1.1.sql
    mysqldump -u $USER $db > $DUMP_DIR/$DATE.sql


# sync the dumb directory with the directory in the s3 bucket
aws s3 sync $DUMP_DIR $S3_SYNC_URL