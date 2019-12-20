## About this ``.vimrc``
- **Automatically install plugins** and color scheme: After this ``.vimrc`` is installed, it start to install all plugins needed if plugin ``vundle`` cannot be found.

## Pre-Installation
### Ubuntu
```bash
sudo apt-get install git curl nodejs npm default-jre default-jdk build-essential cmake python-dev python3-dev clang python
sudo npm -g install instant-markdown-d
pip install flake8
```
### macOS
Install [Homebrew](http://brew.sh/) first by typing

``/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"``

in terminal.

then,
```bash
brew install Caskroom/cask/java nodejs npm git macvim cmake python
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

### macOS
the pre-installed Vim from Apple with borken Python support cannot work with the plugin ``YouCompleteMe``,  
So **use macvim** instead of pre-installed Vim.

## Minimum Configuration
To work with C++ checking and auto complete functionality,  
Linux user might have to add the C++ header directories to ``~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py`` manually.  
  
For example,  
inside ``flags = []`` list,  
adding  

```py
'-x',
'c++',
'-isystem',
'/usr/include/c++/7.4.0',
'-isystem',
'/usr/include/x86_64-linux-gnu',
'-isystem',
'/usr/include',
'-isystem',
'/usr/local/include',
```
