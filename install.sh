#!/usr/bin/env bash

BASE_DIR=$(dirname "$0")
NVIM_DIR="${HOME}/.config/nvim"


function pre_install_mac() {
    brew install Caskroom/cask/java nodejs npm git neovim cmake python3 mono curl
    xcode-select --install
}

function pre_install_ubuntu() {
    sudo apt install -y git curl nodejs npm default-jre default-jdk build-essential cmake \
        python-dev python3-dev clang python python3-pip mono-complete golang-go neovim
    sudo apt-get install -y python3
}

function install_nerd_fonts_mac() {
    brew tap homebrew/cask-fonts
    brew install font-hack-nerd-font
}

function install_nerd_fonts_ubuntu() {
    git clone git@github.com:ryanoasis/nerd-fonts.git nerd-fonts
    pushd nerd-fonts
    ./install.sh Hack
    popd
    rm -rf nerd-fonts
}

function main() {
    echo "Installing packages ..."
    case "$OSTYPE" in
        darwin*)
            pre_install_mac
            install_nerd_fonts_mac ;;
        linux*)
            pre_install_ubuntu
            install_nerd_fonts_ubuntu ;;
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

    echo "Installing color scheme..."
	git clone https://github.com/zeis/vim-kolor.git kolor
    mkdir -p ${NVIM_DIR}/colors
    mv kolor/colors/kolor.vim ${NVIM_DIR}/colors/
    rm -rf kolor

    echo "Creating folders..."
    mkdir -p ${NVIM_DIR}/.backup
    mkdir -p ${NVIM_DIR}/.swp
    mkdir -p ${NVIM_DIR}/.undodir

    echo "Installing vim-plug..."
    curl -fLo ${NVIM_DIR}/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    echo "Running :PlugInstall..."
    nvim +PlugInstall +qall

    echo "Install Coc extensions..."
    nvim +CocInstall coc-json coc-tsserver coc-html coc-css coc-python coc-rls \
        coc-clangd coc-go coc-java coc-yaml coc-prettier coc-docker +qall

    echo "Done!"
}

main
