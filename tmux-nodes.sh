#!/bin/bash

install_ltc() {
    echo "ltc installing.. open, tmux attach -t ltc-node to view"
    tmux new-session -d -s ltc-node './node-install.sh -ltc'
}

install_btc() {
    echo "btc installing.. open, tmux attach -t btc-node to view"
    tmux new-session -d -s btc-node './node-install.sh -btc'
}

install_eth() {
    echo "eth installing.. open, tmux attach -t eth-node to view"
    tmux new-session -d -s eth-node './node-install.sh -eth'
}

install_all() {
    tmux new-session -d -s ltc-node './node-install.sh -ltc'
    tmux new-session -d -s btc-node './node-install.sh -btc'
    tmux new-session -d -s eth-node './node-install.sh -eth'
}

for i in "$@"
    do
    case $i in
        -ltc) install_ltc;;
        -btc) install_btc;; 
        -eth) install_eth;; 
        -all) install_all;;
        *) echo "wrong argument" exit 1;;
    esac
done

