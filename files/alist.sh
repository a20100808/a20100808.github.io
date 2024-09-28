#!/bin/sh

API_URL="https://api.github.com/repos/uubulb/alist-freebsd/releases/latest"

DOWNLOAD_URL=$(curl -s $API_URL | jq -r ".assets[] | select(.name | contains(\"alist\")) | .browser_download_url")

curl -L $DOWNLOAD_URL -o alist

chmod +x alist

echo "Alist-FreeBSD最新版本已经下载完成！"

if [ ! -f "./data/config.json" ]; then
    nohup ./alist server > /dev/null 2>&1 &
    clear
    echo "已生成配置文件"
    echo
fi
