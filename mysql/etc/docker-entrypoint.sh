#!/usr/bin/bash

mv /usr/local/mysql8.0/data/3306/auto.cnf /usr/local/mysql8.0/data/3306/auto.cnf.bak

exec /usr/local/bin/mysqld --defaults-file=/usr/local/mysql8.0/etc/my.cnf 

