cd ~
mkdir -p $1
cd $1
mkdir 0g
cd 0g
sudo apt-get update && sudo apt-get upgrade -y
source .bashrc
apt install snap unzip wget jq
ver="1.21.3" && \
wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz" && \
sudo rm -rf /usr/local/go && \
sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz" && \
rm "go$ver.linux-amd64.tar.gz" && \
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> .bash_profile && \
source .bash_profile && \
go version
wget https://rpc-zero-gravity-testnet.trusted-point.com/evmosd
chmod +x ./evmosd
mv ./evmosd /usr/local/bin/
evmosd config chain-id zgtendermint_9000-1
evmosd init $2 --chain-id zgtendermint_9000-1
wget https://rpc-zero-gravity-testnet.trusted-point.com/genesis.json -O $HOME/.evmosd/config/genesis.json
sed -i '/seeds =/c\seeds = "8c01665f88896bca44e8902a30e4278bed08033f@54.241.167.190:26656,b288e8b37f4b0dbd9a03e8ce926cd9c801aacf27@54.176.175.48:26656,8e20e8e88d504e67c7a3a58c2ea31d965aa2a890@54.193.250.204:26656,e50ac888b35175bfd4f999697bdeb5b7b52bfc06@54.215.187.94:26656"' $HOME/.evmosd/config/config.toml
wget https://rpc-zero-gravity-testnet.trusted-point.com/latest_snapshot.tar.lz4
cp $HOME/.evmosd/data/priv_validator_state.json $HOME/.evmosd/priv_validator_state.json.backup
evmosd tendermint unsafe-reset-all --home $HOME/.evmosd --keep-addr-book
lz4 -d -c ./latest_snapshot.tar.lz4 | tar -xf - -C $HOME/.evmosd
mv $HOME/.evmosd/priv_validator_state.json.backup $HOME/.evmosd/data/priv_validator_state.json
sudo tee /etc/systemd/system/zerog.service > /dev/null <<EOF
[Unit]
Description=0G Node
After=network.target
[Service]
User=root
ExecStart=/root/go/bin/evmosd start
Restart=always
RestartSec=3
LimitNOFILE=infinity
[Install]
WantedBy=multi-user.target
EOF
evmosd keys add $2
