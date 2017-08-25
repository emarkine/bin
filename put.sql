#!/bin/bash                                                                                                                             
# Copyright 2012 EugeneLab
# 
# put.sql
# 
# Загрузка SQL базы данных для текущей точки разработки `basename `pwd`` на сервер
# 
# Usage:
# put.sql

dir=`pwd`
point=`basename $dir`
local_database=$point"_development"
remote_database=$point"_production"
server=$point
echo "local_database: $local_database"
echo "remote_database: $remote_database"
echo "server: $server"

mysqldump -u root $local_database > tmp/$point.sql
scp tmp/$point.sql $point:tmp/$point.sql  
ssh $server "mysql $remote_database < tmp/$point.sql"

