#!/usr/bin/env bash

BASE_DIR=$(dirname "$0")
NVIM_DIR="${HOME}/.config/nvim"


function pre_install_mac() {
    brew install Caskroom/cask/java nodejs npm git neovim cmake python3 mono go curl
    xcode-select --install
}

function pre_install_ubuntu() {
    sudo apt install -y git curl nodejs npm default-jre default-jdk build-essential cmake \
        python-dev python3-dev clang python python3-pip mono-complete golang-go neovim
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
    pip3 install flake8 neovim

    echo "Moving config files..."
    mkdir -p ${NVIM_DIR}
    cp "${BASE_DIR}/init.vim" ${NVIM_DIR}/init.vim
    cp "${BASE_DIR}/.tern-config" ${HOME}

    echo "Installing fonts and color scheme..."
	git clone https://github.com/powerline/fonts.git fonts
    ./fonts/install.sh
	git clone https://github.com/zeis/vim-kolor.git kolor
    mkdir -p ${NVIM_DIR}/colors
    mv kolor/colors/kolor.vim ${NVIM_DIR}/colors/
    rm -rf fonts kolor

    echo "Creating folders..."
    mkdir -p ${NVIM_DIR}/.backup
    mkdir -p ${NVIM_DIR}/.swp
    mkdir -p ${NVIM_DIR}/.undodir

    echo "Installing vim-plug..."
    curl -fLo ${NVIM_DIR}/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    echo "Done."
    echo 'Use `:PlugInstall` to install plugins when VIM is opened next time.'
}

main
