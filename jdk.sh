#!/usr/bin/env bash

#install_jdk
wget http://7lrxhn.com1.z0.glb.clouddn.com/jdk-8u111-linux-x64.tar.gz
tar zxvf jdk-8u111-linux-x64.tar.gz
rm -rf jdk-8u111-linux-x64.tar.gz
mv jdk1.8.0_111 /usr/local/
ln -s /usr/local/jdk1.8.0_111/bin/java /usr/bin/java
echo -e "JAVA_HOME=/usr/local/jdk1.8.0_111;\nexport PATH=\$PATH:\$JAVA_HOME/bin" >> /etc/profile
source /etc/profile