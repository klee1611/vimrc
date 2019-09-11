## Function of this ``.vimrc``
This ``.vimrc`` will **automatically install** some plugins and other related softwares at the first time this ``vimrc`` is used.


## Pre-Installation
### Ubuntu
```bash
sudo apt-get install git curl exuberant-ctags nodejs npm default-jre default-jdk build-essential cmake python-dev python3-dev clang python
sudo npm -g install instant-markdown-d
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
```

## Installation
Afterward, copy the ``.vimrc`` file to the ``$HOME`` directory.
```bash
cp vimrc/.vimrc $HOME/
```
And the Installation is finished.
