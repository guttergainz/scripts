cd ~
mkdir $1
cd $1
mkdir ritual
cd ritual
sudo apt update && sudo apt upgrade -y
sudo apt -qy install curl git jq lz4 build-essential screen
sudo apt install docker.io
sudo curl -L "https://github.com/docker/compose/releases/download/v2.24.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
git clone https://github.com/ritual-net/infernet-container-starter
cd infernet-container-starter
