#!/bin/sh

ssh ubuntu@3.215.162.250 <<EOF
  cd kycapi
  git pull
  source env/bin/activate
  python manage.py migrate
  sudo systemctl restart nginx
  sudo service gunicorn restart
  sudo service nginx restart
  exit
EOF
