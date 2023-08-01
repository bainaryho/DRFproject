#!/bin/bash
APP_NAME=DRFproject

#git pull
echo "git pull"
git pull

#source
echo "venv 실행"

# source
if [ -d "venv/Scripts" ]; then
  source venv/Scripts/activate
else
  source venv/bin/activate
fi

#runserver
echo "runserver"
python manage.py runserver 0.0.0.0:8000