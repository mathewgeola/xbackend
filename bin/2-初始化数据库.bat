@echo off
chcp 65001

cd ..

set BASE_DIR=%CD%
set VENV_DIR=%BASE_DIR%\.venv
set ACTIVATE_PATH=%VENV_DIR%\Scripts\activate.bat

call %ACTIVATE_PATH%

python manage.py makemigrations

python manage.py migrate

set DJANGO_SUPERUSER_PASSWORD=admin

python manage.py createsuperuser --username admin --email admin@example.com --noinput

pause