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

    echo "Installing fonts and color scheme..."
	git clone git@github.com:powerline/fonts.git fonts
    ./fonts/install.sh
	git clone git@github.com:zeis/vim-kolor.git kolor
    mkdir -p ${HOME}/.vim/colors
    mv kolor/colors/kolor.vim ${HOME}/.vim/colors/
    rm -rf fonts kolor

    echo "Creating folders..."
    mkdir -p ${HOME}/.vim/.backup
    mkdir -p ${HOME}/.vim/.swp
    mkdir -p ${HOME}/.vim/.undodir

    echo "Installing vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    echo "Done."
    echo 'Use `:PlugInstall` to install plugins when VIM is opened next time.'
}

main
