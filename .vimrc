set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'tomasr/molokai'
Bundle 'shawncplus/phpcomplete.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" colorscheme molokai

" 在vim裡面執行 :PluginInstall／在shell執行 vim +PluginInstall +qall




set backspace=start
set cindent
set cursorline
"set directory=~/tmp
set encoding=utf8
set expandtab
set fileencoding=utf8
set fileencodings=ucs-bom,utf8,cp950,latin1
set guifont=Inconsolata:h12
set hlsearch
set ignorecase
set incsearch
set laststatus=2
"set list
"set listchars=tab:▷⋅,trail:·
set nobomb
set nocompatible
set number
set ruler
set scrolloff=3
set secure
set shiftwidth=4
set showmatch
set smartcase
set t_Co=256
set visualbell
set wildmenu
syntax on

" color schema
set background=dark
"colo wombat256mod
highlight Search cterm=none ctermbg=blue
"
" keybinding
nmap <Esc>[Z <C-w>W
nmap <Tab> <C-w>w
"
" template
function LoadHTMLTemplate()
    0r ~/.vim/template/production.html
    normal Gdd
endfunction
function LoadJSemplate()
    0r ~/.vim/template/production.js
    normal Gdd
endfunction
function LoadPHPTemplate()
    0r ~/.vim/template/production.php
    normal Gdd
endfunction
function LoadTwigTemplate()
    0r ~/.vim/template/production.twig
    normal Gdd
endfunction

autocmd BufNewFile *.html call LoadHTMLTemplate()
autocmd BufNewFile *.js call LoadJSTemplate()
autocmd BufNewFile *.php call LoadPHPTemplate()
autocmd BufNewFile *.twig call LoadHTMLTemplate()
"
" other
au BufNewFile,BufRead *.psgi setf perl
au BufNewFile,BufRead *.json setf json
au BufNewFile,BufRead Makefile set noexpandtab
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
