#!/bin/bash

echo "gunicorn 설치"
cd /home/lion2/DRFproject/DRFproject
echo "venv 실행"
if [ -d "venv/Scripts" ]; then
  source /home/lion2/DRFproject/venv/Scripts/activate
else
  source /home/lion2/DRFproject/venv/bin/activate
fi
cd ..
gunicorn DRFproject.wsgi:application --config DRFproject/gunicorn_config.py