ufw allow 8000
sudo ufw allow ssh
ufw allow 9000
sudo ufw enable
sudo echo 'deb http://security.ubuntu.com/ubuntu jammy-security main' >> nano /etc/apt/sources.list
sudo apt update
sudo apt upgrade
sudo apt install libc6
sudo adduser hyperliquid
sudo usermod -aG sudo hyperliquid
su - hyperliquid
curl https://binaries.hyperliquid.xyz/Testnet/initial_peers.json > ~/initial_peers.json
echo '{"chain": "Testnet"}' > ~/visor.json
curl https://binaries.hyperliquid.xyz/Testnet/non_validator_config.json > ~/non_validator_config.json
curl https://binaries.hyperliquid.xyz/Testnet/hl-visor > ~/hl-visor && chmod a+x ~/hl-visor
~/hl-visor
