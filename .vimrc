" vim settings

" Turn on syntax highlighting
syntax on

" Turn on auto indenting dependent on file type
filetype indent on
set autoindent

" Highlight searches
set hls

" Case insensitive search
set ic

" Turn on line numbering
set nu

" 2 space tabs
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

" vim-pathogen
call pathogen#infect()

" Open NERDTree automatically
autocmd vimenter * if !argc() | NERDTree | endif

