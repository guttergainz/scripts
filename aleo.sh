cd ~
mkdir -p $1
cd $1
mkdir aleo
cd aleo
sudo apt-get update && sudo apt-get upgrade -y
apt install screen git -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
git clone https://github.com/AleoHQ/snarkOS.git --depth 1
cd snarkOS
git fetch origin testnet3:testnet3
git checkout testnet3
./build_ubuntu.sh
cargo install --path .
snarkos account new
screen -S aleo -d -m ./run-prover.sh
