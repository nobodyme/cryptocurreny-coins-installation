#!/bin/bash

install_ltc() {
    wget -P ~/ https://download.litecoin.org/litecoin-0.16.0/linux/litecoin-0.16.0-x86_64-linux-gnu.tar.gz
    tar -zxvf ~/litecoin-0.16.0-x86_64-linux-gnu.tar.gz -C ~/
    install -m 0755 -o root -g root -t /usr/local/bin ~/litecoin-0.16.0/bin/*
    rm -rf ~/litecoin-0.16.0/ ~/litecoin-0.16.0-x86_64-linux-gnu.tar.gz
    mkdir ~/.litecoin
    cp sample.conf ~/.litecoin/litecoin.conf
    litecoind -printtoconsole
}

install_btc() {
    apt-add-repository ppa:bitcoin/bitcoin -y
    apt-get update
    apt-get install bitcoind
    mkdir ~/.bitcoin
    cp sample.conf ~/.bitcoin/bitcoin.conf
    bitcoind -printtoconsole
}

install_eth() {
    apt-get install software-properties-common
    add-apt-repository -y ppa:ethereum/ethereum
    apt-get update
    apt-get install -y ethereum
    geth --rpc --rpccorsdomain "*" --rpcapi "eth,web3,admin,miner,personal,txpool"
}

install_bch() {
    wget -P ~/ https://download.bitcoinabc.org/0.17.2/linux/bitcoin-abc-0.17.2-x86_64-linux-gnu.tar.gz
    tar -zxvf ~/bitcoin-abc-0.17.2-x86_64-linux-gnu.tar.gz -C ~/
    mkdir -p ~/bitcoincash/binaries ~/.bitcoin
    cp sample.conf ~/.bitcoin/bitcoin.conf
    cp ~/bitcoin-abc-0.17.2/bin/* ~/bitcoincash/binaries
    rm -rf ~/bitcoin-abc-0.17.2-x86_64-linux-gnu.tar.gz ~/bitcoin-abc-0.17.2/
    ~/bitcoincash/binaries/bitcoind -printtoconsole
}

for i in "$@"
    do
    case $i in
        -ltc) install_ltc;;
        -btc) install_btc;; 
        -eth) install_eth;;
        -bch) install_bch;;
        *) echo "wrong argument" exit 1;;
    esac
done

