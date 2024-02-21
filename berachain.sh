cd ~
mkdir -p $1
cd $1
mkdir berachain
cd berachain
apt-get update && sudo apt-get upgrade -y
apt-get install git make screen jq -y
wget https://golang.org/dl/go1.21.4.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.21.4.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
curl -L https://foundry.paradigm.xyz | bash
source /root/.bashrc
foundryup
git clone https://github.com/berachain/polaris
cd polaris
git checkout main
make start
