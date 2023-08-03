FROM python:3.11-alpine

ARG APP_HOME=/app

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN mkdir ${APP_HOME}
WORKDIR ${APP_HOME}

COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . ${APP_HOME}
# 현재 폴더의 모든 파일 여기에 복사

RUN python manage.py migrate
RUN python manage.py collectstatic -c

CMD [ "gunicorn", "DRFproject.wsgi:application", "--config", "DRFproject/gunicorn_config.py" ]