## Function of this ``.vimrc``
This ``.vimrc`` will **automatically install** some plugins and other related softwares at the first time this ``vimrc`` is used.

Here is the effect:

C/C++ coding:
[![Screenshot][c_c++_code]][c_c++_code]

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

[c_c++_code]: https://dl.dropboxusercontent.com/u/27853118/github_screenshot/c_c%2B%2B_code.gif
[markdown]: https://dl.dropboxusercontent.com/u/27853118/github_screenshot/markdown.gif
[language_tool]: https://dl.dropboxusercontent.com/u/27853118/github_screenshot/languageTool.gif
