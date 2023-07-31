#!/bin/bash

#git clone
echo "실행 : git clone"
git clone https://github.com/bainaryho/DRFproject.git
cd DRFproject
#venv 설치
echo "설치 : venv"
sudo apt-get update && sudo apt install -y python3.8-venv
#venv 구성
echo "구성 : venv"
python3 -m venv venv
#가상환경 작동
echo "가상환경 시작"
source venv/bin/activate
#pip install
echo "설치 : pip requirements"
pip install -r requirements.txt
#runserver
echo "시작 : runserver"
python manage.py runserver 0.0.0.0:8000