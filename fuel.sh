cd ~
mkdir -p $1
cd $1
mkdir fuel
cd fuel
sudo apt-get update && sudo apt-get upgrade -y
apt install screen git -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl https://install.fuel.network | sh
curl -sSL https://raw.githubusercontent.com/FuelLabs/fuel-core/v0.22.0/deployment/scripts/chainspec/beta_chainspec.json > chainConfig.json
source /root/.bashrc
fuel-core-keygen new --key-type peering
read -p "Enter value for private key : " VARIABLE1
read -p "Enter value for node name : " VARIABLE2
read -p "Enter value for RPC endpoint : " VARIABLE3
screen -S fuel
fuel-core run \
--service-name VARIABLE2 \
--keypair VARIABLE1 \
--relayer VARIABLE3 \
--ip 0.0.0.0 --port 4631 --peering-port 35433 \
--db-path  ~/.fuel_beta5 \
--chain ./chainConfig.json \
--utxo-validation --poa-instant false --enable-p2p \
--min-gas-price 1 --max-block-size 18874368  --max-transmit-size 18874368 \
--reserved-nodes /dns4/p2p-beta-5.fuel.network/tcp/30333/p2p/16Uiu2HAmSMqLSibvGCvg8EFLrpnmrXw1GZ2ADX3U2c9ttQSvFtZX,/dns4/p2p-beta-5.fuel.network/tcp/30334/p2p/16Uiu2HAmVUHZ3Yimoh4fBbFqAb3AC4QR1cyo8bUF4qyi8eiUjpVP \
--sync-header-batch-size 100 \
--enable-relayer \
--relayer-v2-listening-contracts 0x557c5cE22F877d975C2cB13D0a961a182d740fD5 \
--relayer-da-deploy-height 4867877 \
--relayer-log-page-size 2000

