## Overview
For neovim.  
Still under development.  
Use this at your own risk.  

## Support Languages
* Python
* Javascript
* C/C++
* Golang
* Markdown

## About this `.vimrc`
* Auto-complete with `YouCompleteMe`
* Auto code snips
* Git tool
* Nerdtree
* Syntax and lint checking
* Plugins install automatically with `vim-plug`
* Color scheme and fonts install automatically

## For Mac users
For those who use this config on a Mac,  
[Homebrew](http://brew.sh/) must be installed.  
Also,  
since the pre-installed Vim from Apple with borken Python support cannot work with the plugin `YouCompleteMe`,  
**use macvim** instead of pre-installed Vim.

## Configuration
### C++ automatically complete
To work with C++ checking and auto complete functionality,  
Linux users have to add paths to the directories of the C++ header to `~/.vim/plugged/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py` manually.  
  
For example,  
inside `flags = []` list,  
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
