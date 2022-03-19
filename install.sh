#!/usr/bin/env bash

BASE_DIR=$(dirname "$0")


function pre_install_mac() {
    brew install Caskroom/cask/java nodejs npm git macvim cmake python3 mono go curl
    xcode-select --install
}

function pre_install_ubuntu() {
    sudo apt install -y git curl nodejs npm default-jre default-jdk build-essential cmake \
        python-dev python3-dev clang python python3-pip mono-complete golang-go
    sudo apt-get install -y python3
}

function main() {
    echo "Installing packages ..."
    case "$OSTYPE" in
        darwin*)
            pre_install_mac ;;
        linux*)
            pre_install_ubuntu ;;
        *)
            echo "OS $OSTYPE not supported"
    esac

    npm -g install instant-markdown-d
    npm install -g eslint
    pip3 install flake8

    echo "Moving config files..."
    mv "${BASE_DIR}/.vimrc" ${HOME}
    mv "${BASE_DIR}/.tern-config" ${HOME}

    echo "Done."
    echo "Plugins will be installed when VIM is opened next time."
}

main
