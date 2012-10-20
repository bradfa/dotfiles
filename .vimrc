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

" Use mouse selections
set mouse=a

" Decent font
set gfn=Liberation\ Mono\ 10

" Code folding
" toggle on with za, fold all with zm, open all zr
" close with zc, open with zo
set foldmethod=indent
set foldnestmax=1
set nofoldenable
set foldlevel=1

" Some reasonable colors
set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif

" 2 space tabs
"set softtabstop=2
"set shiftwidth=2
"set tabstop=2
"set expandtab

" vim-pathogen
call pathogen#infect()

" Open NERDTree automatically, close vim if only NERDTree is open
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
