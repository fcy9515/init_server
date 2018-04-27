#!/usr/bin/env bash
yum install -y zlib-devel
wget http://nginx.org/download/nginx-1.11.7.tar.gz
tar zxvf nginx-1.11.7.tar.gz
cd nginx-1.11.7
./configure --prefix=/usr/local/nginx --without-http_rewrite_module --without-http_gzip_module
make && make install
cd ..
rm -rf nginx*
echo "export PATH=\$PATH:/usr/local/nginx/sbin" >> /etc/profile
source /etc/profile
nginx

#开机启动
cat > /usr/lib/systemd/system/nginxd.service <<EOF
[Unit]
Description=nginx
After=network.target

[Service]
Type=forking
ExecStart=/usr/local/nginx/sbin/nginx
ExecReload=/usr/local/nginx/sbin/nginx -s reload
ExecStop=/usr/local/nginx/sbin/nginx -s stop
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOF
systemctl enable nginxd.service
