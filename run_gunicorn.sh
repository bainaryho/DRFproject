#!/bin/bash

echo "gunicorn 설치"
cd /home/lion3/DRFproject/DRFproject
echo "venv 실행"
if [ -d "venv/Scripts" ]; then
  source /home/lion3/DRFproject/venv/Scripts/activate
else
  source /home/lion3/DRFproject/venv/bin/activate
fi
cd ..
gunicorn DRFproject.wsgi:application --config DRFproject/gunicorn_config.py