FROM python:3.7-alpine
LABEL maintainer="Israel Solha"

ENV PYTHONUNBUFFORED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

COPY . /
WORKDIR /password_generator-project

RUN adduser -D user
USER user

CMD python ./manage.py runserver 0.0.0.0:8000