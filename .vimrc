" vim settings

" Turn on syntax highlighting
syntax on

" Always wrap at 80 columns
set tw=80
set colorcolumn=81

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

" Decent GUI font
if has('gui_running')
  set guifont=Fixed\ 11
endif

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

" Exec pwd .vimrc if present
set exrc

" 2 space tabs, Python or CLFS
function TabCLFS()
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
endfunction

" tabs are 4 columns, K&R style
function TabKandR()
set softtabstop=4
set shiftwidth=4
set tabstop=4
set noexpandtab
endfunction

" tabs are 8 columns, Linux style
function TabLinux()
set softtabstop=8
set shiftwidth=8
set tabstop=8
set noexpandtab
endfunction

" vim-pathogen
call pathogen#infect()

" Open NERDTree automatically, close vim if only NERDTree is open
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Use utf-8
scriptencoding utf-8
set encoding=utf-8

if has("autocmd")
	" For mutt wrap at 72
	au FileType mail,tex set textwidth=72
endif
