ufw allow 8000
ufw allow 9000
sudo adduser hyperliquid
sudo usermod -aG sudo hyperliquid
su - hyperliquid
curl https://binaries.hyperliquid.xyz/Testnet/initial_peers.json > ~/initial_peers.json
echo '{"chain": "Testnet"}' > ~/visor.json
curl https://binaries.hyperliquid.xyz/Testnet/non_validator_config.json > ~/non_validator_config.json
curl https://binaries.hyperliquid.xyz/Testnet/hl-visor > ~/hl-visor && chmod a+x ~/hl-visor
