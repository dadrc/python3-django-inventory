FROM python:3-alpine
RUN apk update && \
    apk upgrade && \
    apk add git netcat-openbsd && \
    pip install django django-crispy-forms psycopg2-binary
WORKDIR /app
RUN django-admin startproject website
WORKDIR /app/website
COPY src/entry.sh .
RUN git clone https://github.com/dadrc/python3-django-inventory inventory && \
    sed -i "1 i\from django.urls import include, re_path" website/urls.py && \
    sed -i "1 i\from django.conf.urls.static import static" website/urls.py
CMD sh entry.sh
EXPOSE 8000/tcp
