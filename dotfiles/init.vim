"load system defaults
if filereadable(expand('$VIMRUNTIME/defaults.vim'))
	unlet! g:skip_defaults_vim
	source $VIMRUNTIME/defaults.vim
endif

"regular settings
"----------------
" ui
set number
set ruler
set wildmenu
set showcmd
set showmatch
set mouse=a

" Clipboard
set clipboard+=unnamedplus

" encoding/format
set encoding=utf-8
set fileformats=unix,dos,mac

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" indent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

" key timeout values
set ttimeoutlen=20
set timeoutlen=1000

" allow syntax and filetype plugins
syntax enable
filetype plugin indent on

" Ctrl+Backspace delete word in insert mode
set backspace=indent,eol,start
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" Experiments
set wildmode=list:full
