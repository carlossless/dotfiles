" General
set encoding=utf-8
syntax on
set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Airline and visual features
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'b4winckler/vim-objc.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Keithbsmiley/swift.vim'
Plugin 'cfdrake/vim-carthage'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required

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
