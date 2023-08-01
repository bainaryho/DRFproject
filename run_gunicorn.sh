#!/bin/bash

echo "gunicorn 설치"
cd /home/lion/DRFproject/DRFproject
echo "venv 실행"
if [ -d "venv/Scripts" ]; then
  source /home/lion/DRFproject/venv/Scripts/activate
else
  source /home/lion/DRFproject/venv/bin/activate
fi
cd ..
gunicorn DRFproject.wsgi:application --config DRFproject/gunicorn_config.py