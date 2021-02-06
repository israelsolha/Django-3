FROM python:3.7-alpine
LABEL maintainer="Israel Solha"

ENV PYTHONUNBUFFORED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

COPY personal_portfolio-project /
WORKDIR /personal_portfolio-project

RUN adduser -D user
USER user

CMD ls -la && pwd && python ./manage.py runserver 0.0.0.0:8000