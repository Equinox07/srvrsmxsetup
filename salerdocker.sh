sudo apt update
sudo reboot
sudo apt update && sudo apt-get upgrade -y --fix-missing && sudo apt -y install build-essential checkinstall && sudo apt -y install ubuntu-restricted-extras && sudo apt -y install software-properties-common
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

sudo apt update
git clone https://github.com/mirumee/saleor-platform.git
cd saleor-platform
docker-compose build
docker-compose run --rm api python3 manage.py migrate
docker-compose run --rm api python3 manage.py collectstatic --noinput
docker-compose run --rm api python3 manage.py populatedb --createsuperuser
docker-compose up
