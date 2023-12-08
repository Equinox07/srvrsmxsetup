#!/bin/sh

ssh ubuntu@xx.xx.xxx <<EOF
  cd kycapi
  git pull
  source env/bin/activate
  python manage.py migrate
  sudo systemctl restart nginx
  sudo service gunicorn restart
  sudo service nginx restart
  exit
EOF
