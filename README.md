## About this ``.vimrc``
**Automatically install plugins** and color scheme
    After this ``.vimrc`` is installed, it start to install all plugins needed if plugin ``vundle`` cannot be found.

## Pre-Installation
### Ubuntu
```bash
sudo apt-get install git curl exuberant-ctags nodejs npm default-jre default-jdk build-essential cmake python-dev python3-dev clang python
sudo npm -g install instant-markdown-d
pip install flake8
```
### OS X
Install [Homebrew](http://brew.sh/) first by typing

``/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"``

in terminal.

then,
```bash
brew install ctags Caskroom/cask/java nodejs npm git macvim cmake python
sudo npm -g install instant-markdown-d
xcode-select --install
pip install flake8
```

## Installation
Afterward, copy the ``.vimrc`` file to the ``$HOME`` directory.
```bash
cp vimrc/.vimrc $HOME/
```
And the installation of plugins will begin automatically at the first time ``vim`` is executed.
