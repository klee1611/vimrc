## Function of this ``.vimrc``
This ``.vimrc`` will **automatically install** some plugins and other related softwares at the first time this ``vimrc`` is used.

Here is the effect:

C/C++ coding:

[![Screenshot][c_cpp_code_1]][c_cpp_code_1]
[![Screenshot][c_cpp_code_2]][c_cpp_code_2]

English grammer checking:
[![Screenshot][language_tool]][language_tool]

Real-time viewing of markdown files:
[![Screenshot][markdown]][markdown]

## Pre-Installation
### Ubuntu
```bash
sudo apt-get install exuberant-ctags nodejs npm default-jre default-jdk
sudo npm -g install instant-markdown-d
```
### OS X
Install [Homebrew](http://brew.sh/) first by typing 

``/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`` 

in terminal.

then,
```bash
brew install ctags Caskroom/cask/java nodejs npm 
sudo npm -g install instant-markdown-d
```

## Installation
Afterward, copy the ``.vimrc`` file to the ``$HOME`` directory.
```bash
cp vimrc/.vimrc $HOME/
```
And the Installation is finished.

[c_cpp_code_1]: https://dl.dropboxusercontent.com/u/27853118/github_screenshot/c_cpp_coding_1.gif 
[c_cpp_code_2]: https://dl.dropboxusercontent.com/u/27853118/github_screenshot/c_cpp_coding_2.gif
[markdown]: https://dl.dropboxusercontent.com/u/27853118/github_screenshot/markdown.gif
[language_tool]: https://dl.dropboxusercontent.com/u/27853118/github_screenshot/languageTool.gif
