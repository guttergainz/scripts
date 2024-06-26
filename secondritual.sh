nano deploy/config.json
docker restart anvil-node
docker restart hello-world
docker restart deploy-node-1
docker restart deploy-fluentbit-1
docker restart deploy-redis-1
cd ..
mkdir foundry
cd foundry
curl -L https://foundry.paradigm.xyz | bash
source ~/.bashrc
foundryup
cd ../infernet-container-starter/projects/hello-world/contracts
forge install --no-commit foundry-rs/forge-std
forge install --no-commit ritual-net/infernet-sdk
cd ../../..
project=hello-world make deploy-contracts
