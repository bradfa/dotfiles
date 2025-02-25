" vim settings

" Turn on syntax highlighting
syntax on

" Highlight the 81st and 101st columns
set colorcolumn=81,101

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

" Decent font if GUI
if has('gui_running')
  set guifont=terminus\ 12
endif

" Some reasonable colors
if has('gui_running')
  set t_Co=256
  colorscheme morning
else
  set t_Co=16
  colorscheme default
endif

" Code folding
" toggle on with za, fold all with zm, open all zr
" close with zc, open with zo
set foldmethod=indent
set foldnestmax=1
set nofoldenable
set foldlevel=1

" Exec pwd .vimrc if present
set exrc

" 2 space tabs, Python or CLFS
function TabPythonClfs()
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
endfunction

" tabs are 4 spaces, OE, Rust, or KA style
function TabOeRustKa()
set softtabstop=4
set shiftwidth=4
set tabstop=4
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

" Open NERDTree automatically, close vim if only NERDTree is open
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Toggle NERDTree on/off with CTRL-N
map <C-n> :NERDTreeToggle<CR>

" Use utf-8
scriptencoding utf-8
set encoding=utf-8

if has("autocmd")
	" For mutt and git commits, wrap at 72
	au FileType mail,tex set textwidth=72
	au FileType gitcommit set textwidth=72
endif

" cscope enablement
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb
	" Using 'CTRL-spacebar' then a search type makes the vim window
	" split horizontally, with search result displayed in
	" the new window.

	nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>a :scs find a <C-R>=expand("<cword>")<CR><CR>

	" Hitting CTRL-space *twice* before the search type does a vertical
	" split instead of a horizontal one

	nmap <C-Space><C-Space>s
		\:vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>g
		\:vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>c
		\:vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>t
		\:vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>e
		\:vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>i
		\:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-Space><C-Space>d
		\:vert scs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>a
		\:vert scs find a <C-R>=expand("<cword>")<CR><CR>
endif
