cd ~
mkdir -p $1
cd $1
mkdir eigenlayer
cd eigenlayer
wget https://golang.org/dl/go1.21.4.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.21.4.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
git clone https://github.com/Layr-Labs/eigenlayer-cli.git
cd eigenlayer-cli
mkdir -p build
go build -o build/eigenlayer cmd/eigenlayer/main.go
cp ./build/eigenlayer /usr/local/bin/
eigenlayer operator keys create --key-type ecdsa $1
eigenlayer operator keys create --key-type bls $1
eigenlayer operator config create
