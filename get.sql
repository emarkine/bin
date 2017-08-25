#!/bin/bash                                                                                                                             
# Copyright 2011 EugeneLab
# 
# upload.sql
# 
# Загрузка SQL базы данных для текущей точки разработки `basename `pwd`` с сервера 
# 
# Usage:
# upload.sql

dir=`pwd`
point=`basename $dir`
local_database=$point"_development"
remote_database=$point"_production"
server=$point
echo "local_database: $local_database"
echo "remote_database: $remote_database"
echo "server: $server"

ssh $server "/usr/bin/mysqldump $remote_database --skip-comments > tmp/$point.sql"
ssh $server "gzip -f tmp/$point.sql"
scp -p $server:tmp/$point.sql.gz tmp/
gunzip -f tmp/$point.sql.gz
mysql -u root $local_database < tmp/$point.sql

# rsync -e "ssh -p$PORT" --progress -lzuogthvr --delete-after $SERVER:/var/store/$APP/ /var/store/$APP/
