#! /bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
apt-get update
cd /root
wget https://github.com/Wind4/vlmcsd/releases/download/svn1111/binaries.tar.gz
tar zxf binaries.tar.gz
cd binaries/Linux/intel/static
mv vlmcsdmulti-x64-musl-static /usr/local/KMS-server
chmod u+x /usr/local/KMS-server
cd /root && rm -rf binaries binaries.tar.gz
apt-get install supervisor -y
echo "[program:kms]
command=/usr/local/KMS-server vlmcsd
autorestart=true
autostart=true
user=root" > /etc/supervisor/conf.d/kms.conf
/etc/init.d/supervisor restart