cd app
#git pull
echo "git pull"
git pull https://github.com/bainaryho/DRFproject.git
#source
echo "venv 실행"
source venv/bin/activate
#runserver
echo "runserver"
python manage.py runserver