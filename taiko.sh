cd ~
mkdir -p $1
cd $1
mkdir taiko
cd taiko
sudo apt update && sudo apt upgrade -y
sudo apt install pkg-config curl git-all build-essential libssl-dev libclang-dev ufw
sudo apt-get install ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo apt install docker-compose
git clone https://github.com/taikoxyz/simple-taiko-node.git
cd simple-taiko-node
cp .env.sample .env
nano .env
source .env
docker compose up -d
