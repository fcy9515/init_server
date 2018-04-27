#!/usr/bin/env bash
yum install ncurses-devel

wget http://sourceforge.net/projects/htop/files/htop/1.0.2/htop-1.0.2.tar.gz
tar zxvf htop-1.0.2.tar.gz
cd htop-1.0.2
./configure --disable-unicode --prefix=/usr/local/htop
make 
make install
ln -s /usr/local/htop/bin/htop /usr/local/bin/htop