#!/bin/bash

FILENAME=pm-backup-lcl-`date +%Y%m%d"-"%H%M%S`.sql

docker exec -t pm-database-lcl pg_dump -c -U pm pm > $FILENAME
