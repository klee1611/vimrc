" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0

" Term-dependent settings and background color {{{
if ($TERM == "cygwin")
	set term=xterm
	let &t_AB="\e[48;5;%dm"
	let &t_AF="\e[38;5;%dm"
elseif ($TERM == "vt100")
	set t_AF=[1;3%p1%dm
	set t_AB=[4%p1%dm
endif

set t_Co=256
" }}}

" Plugins (Install or Update) {{{
if has('python3')
endif

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !python3 ./install.py --all
	silent call mkdir(expand("cpp/ycm", 1), 'p')
    !cp third_party/ycmd/examples/.ycm_extra_conf.py cpp/ycm/.ycm_extra_conf.py
  endif
endfunction

call plug#begin('~/.vim/plugged')

" Code snips
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Code auto-complete
Plug 'jiangmiao/auto-pairs'            " Auto complete {, [, (...
Plug 'ervandew/supertab'               " Use tab to complete file path, ...
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM')  }
Plug 'junegunn/vim-easy-align'         " alignment for whitespace, :, =, ...
Plug 'bronson/vim-trailing-whitespace' " eliminate whitespace at the end of each line

" lint, syntax
Plug 'vim-syntastic/syntastic'                          " syntax check
Plug 'nvie/vim-flake8', {'for': 'python'}               " python flake8 format check
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'} " python flake8 indent correct
Plug 'fatih/vim-go', {'do': ':silent :GoUpdateBinaries', 'for': 'go'}

" VIM display
Plug 'sheerun/vim-polyglot'            " language packs
Plug 'bling/vim-airline'

" Other help tools
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'preservim/tagbar'
Plug 'tpope/vim-fugitive'              " git command in vim
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

call plug#end()
" }}}

" Plugins parameters {{{
" tagbar settings
" let g:tagbar_ctags_bin = 'c:\tools\ctags58\ctags.exe'
let g:tagbar_width = 30

" YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" NERDTree settings
let NERDTreeWinPos = 'right'
let NERDTreeWinSize = 30

" vim-airline settings
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
set encoding=utf-8
let g:airline_powerline_fonts = 1

" syntastic settings (vim-syntastic)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_javascript_standard_generic = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint'
let g:syntastic_python_checkers = ['python']
let g:syntastic_python_python_exec = 'python3'
" }}}

" General settings {{{
set cino=(0,g0,N-s,t0
set nocp             " Not compatible with vi
set invcursorline
set wildmenu         " Complete the
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/undodir//
set backup           " keep a backup file
set bs=2             " allow backspacing over everything in insert mode
set ai               " always set autoindenting on
set smartindent
set viminfo='20,\"50 " read/write a .viminfo file, don't store more
set showmatch        " Show the matching braces and so on with different color
set tabstop=4        " The width of a Tab (not whitespace)
"set softtabstop=4   " Use whitespace to replace tab (use this or tabstop, choose one)
set shiftwidth=4     " The width of the moving when using >> to move the content of a line
set expandtab        " Replace tab with space
set ru               " Display current position in thie file (at which line which word) at the bottom
set nu               " Display line number at left
set ignorecase       " Search both upper and lower case
set hlsearch
set incsearch        " Show result before finishing entering keywords
set mouse-=a
colorscheme kolor
set showmode         " Show mode at bottom
" }}}

" VIM version settings and key bindings {{{
if version >= 600
	set foldmethod=marker
	set foldlevel=1
	set fileencodings=ucs-bom,utf-8,sjis,big5,latin1
else
	set fileencoding=taiwan
endif

" Key binding
if version >= 700
	map <F2> :NERDTreeToggle<CR>
	map <F3> :Tagbar<CR>
	map <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
	map <F5> :set tags=tags;/<CR>

	map t1 :tabn 1<CR>
	map t2 :tabn 2<CR>
	map t3 :tabn 3<CR>
	map t4 :tabn 4<CR>
	map t5 :tabn 5<CR>
	map t6 :tabn 6<CR>
	map t7 :tabn 7<CR>
	map t8 :tabn 8<CR>
	map t9 :tabn 9<CR>
	map t0 :tabn 10<CR>
	map tc :tabnew<CR>
	map tn :tabn<CR>
	map tp :tabp<CR>
	map tk :tabclose<CR>

	map <leader><space> :FixWhitespace<CR>
	xmap ga <Plug>(EasyAlign)
	nmap ga <Plug>(EasyAlign)

	highlight TabLineSel term=bold,underline cterm=bold,underline ctermfg=7 ctermbg=0
	highlight TabLine    term=bold cterm=bold
	highlight clear TabLineFill
end

" Crontabs must be edited in place
au BufRead /tmp/crontab* :set backupcopy=yes
" }}}

