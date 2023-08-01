#!/bin/bash

#현재 서버의 ip주소를 입력받아 nginx설정에 넣기
SERVER_IP=

# -i 인자로 server_ip가 들어오면 해당 ip사용
# 그렇지 않으면, curl ifconfig.me 이용 자동 ip 입력

MANUAL="Usage: $0 [-i server_ip]"

while getopts "i:" option; do
    case $option in
        i)
            SERVER_IP=$OPTARG
            ;;
        *)
            echo $MANUAL
            exit 1
            ;;
    esac
done

if [ -z $SERVER_IP ]; then
    SERVER_IP=$(curl ifconfig.me)
fi

echo "엔진엑스 설치"
sudo apt install -y nginx

echo "nginx.conf 생성"
sudo sh -c 'cat > /etc/nginx/sites-available/django <<EOF
server {
        listen 80;
        server_name $SERVER_IP;

        location / {
                proxy_pass http://127.0.0.1:8000;
                proxy_set_header Host \\\$host;
                proxy_set_header X-Real-IP \\\$remote_addr;
        }
}
EOF'

echo "심볼릭링크 생성"

TARGET_CONF=/etc/nginx/sites-enabled/

if [ -e $TARGET_CONF ]; then
    echo "remove symblink"
    sudo rm $TARGET_CONF
fi

sudo ln -s /etc/nginx/sites-available/django $TARGET_CONF

echo "엔진엑스 재시작"
sudo systemctl restart nginx