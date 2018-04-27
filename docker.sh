#!/usr/bin/env bash
yum install -y docker
tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://fy707np5.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker