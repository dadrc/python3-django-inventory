#!/bin/sh
while ! nc -z $POSTGRES_HOSTNAME 5432; do
    sleep 1
done
python manage.py makemigrations
python manage.py migrate
grep -q "re_path(r'^', include(('inventory.urls', 'inventory'), namespace='inventory'))," website/urls.py || \
     sed -i "/^urlpatterns.*/a \    re_path(r'^', include(('inventory.urls', 'inventory'), namespace='inventory'))," website/urls.py
python manage.py collectstatic --noinput
if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ] && [ -n "$DJANGO_SUPERUSER_EMAIL_ADDRESS" ] ; then
    (python manage.py createsuperuser --no-input --email "$DJANGO_SUPERUSER_EMAIL_ADDRESS")
fi
python manage.py runserver --insecure 0.0.0.0:8000
