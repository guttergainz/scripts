cd ~
mkdir $1
cd $1
mkdir elixir
cd elixir
curl -O https://files.elixir.finance/Dockerfile
nano Dockerfile
docker build . -f Dockerfile -t elixir-validator
docker run -d --restart unless-stopped --name ev elixir-validator
