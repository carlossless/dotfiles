" General
set encoding=utf-8
syntax on
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" Airline and visual features
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'b4winckler/vim-objc'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Keithbsmiley/swift.vim'
Plug 'cfdrake/vim-carthage'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'flazz/vim-colorschemes'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" Airline
set laststatus=2
let g:airline_theme='dark'
let g:airline_powerline_fonts=1
let g:airline_detect_modified=1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1

" Visual
set term=xterm-256color
set termencoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set t_Co=256

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Menlo\ for\ Powerline
   endif
endif


" Control
set backspace=indent,eol,start

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" General
filetype plugin on
