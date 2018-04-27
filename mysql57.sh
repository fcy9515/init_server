#!/usr/bin/env bash
rpm -ivh http://mirror.centos.org/centos/6/os/x86_64/Packages/libaio-0.3.107-10.el6.x86_64.rpm --force --nodeps

wget http://mirrors.ustc.edu.cn/mysql-ftp/Downloads/MySQL-5.7/mysql-5.7.22-1.el7.x86_64.rpm-bundle.tar
tar xvf mysql-5.7.22-1.el7.x86_64.rpm-bundle.tar
rpm -ivh mysql-community-common-5.7.22-1.el7.x86_64.rpm --force --nodeps
rpm -ivh mysql-community-libs-5.7.22-1.el7.x86_64.rpm --force --nodeps
rpm -ivh mysql-community-client-5.7.22-1.el7.x86_64.rpm --force --nodeps
rpm -ivh mysql-community-server-5.7.22-1.el7.x86_64.rpm --force --nodeps

#初始化密码
mysqld --initialize-insecure
cat /var/log/mysqld.log

#启动
systemctl start mysqld.service
mysql -u root -p
set password=password('123456');