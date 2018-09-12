#!/bin/bash

install_ltc() {
    echo "ltc installing.."
}

install_btc() {
    echo "btc installing.."   
}

install_eth() {
    echo "eth installing.."
    apt-get install software-properties-common
	add-apt-repository -y ppa:ethereum/ethereum
	apt-get update
	apt-get install -y ethereum
	geth --rpc --rpccorsdomain "*" --rpcapi "eth,web3,admin,miner,personal,txpool"
}

for i in "$@"
    do
    case $i in
        -ltc) install_ltc;;
        -btc) install_btc;; 
        -eth) install_eth;;
        *) echo "wrong argument" exit 1;;
    esac
done

