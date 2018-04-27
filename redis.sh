#!/usr/bin/env bash
wget http://download.redis.io/releases/redis-3.2.11.tar.gz
tar -zxvf redis-3.2.11.tar.gz
cd redis-3.2.11
make PREFIX=/usr/local/redis install
cp init_server/redis.conf /usr/local/redis/

#开机启动
cat > /usr/lib/systemd/system/redis.service <<EOF
[Unit]
Description=redis
After=network.target

[Service]
Type=forking
ExecStart=/usr/local/redis/bin/redis-server /usr/local/redis/redis.conf
ExecStop=/usr/local/bin/redis-cli -h 127.0.0.1 -p 6379 shutdown

[Install]
WantedBy=multi-user.target
EOF
systemctl enable redis.service