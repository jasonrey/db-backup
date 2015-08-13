#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR
source ./config
/usr/bin/mysqldump --user=$USER --password=$PASSWORD --host=$HOST --skip-lock-tables --skip-extended-insert $DB > backup.sql

zip backup.zip backup.sql

git add backup.zip
git commit -m "Backup"
git push origin master
