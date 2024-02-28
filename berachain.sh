cd ~
mkdir -p $1
cd $1
mkdir berachain
cd berachain
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install git make screen jq -y
wget https://golang.org/dl/go1.21.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.21.4.linux-amd64.tar.gz
set_go_bash
curl -L https://foundry.paradigm.xyz | bash
export PATH=$PATH:/usr/local/go/bin
source /root/.bashrc
foundryup
git clone https://github.com/berachain/polaris
cd polaris
git checkout main
make start
