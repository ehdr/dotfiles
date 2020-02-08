if filereadable(glob('~/.exrc'))
    source ~/.exrc
endif

set nocompatible    " no vi compatibility mode

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Be smart when using tabs
set smarttab

set autoindent
set smartindent

set showcmd         " info about ongoing cmd, e.g. selection dimensions
set laststatus=2    " display status line always

set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]

" Show matching brackets when text indicator is over them
set showmatch

" For regular expressions turn magic on
set magic

set nobackup

set incsearch       " incremental search
set hlsearch        " highlight matches
set smartcase       " in search

set completeopt=longest,menuone

set wildmode=longest,list,full
set wildmenu

set history=10000

set lazyredraw

set nowrap
set scrolloff=7

set mouse=a


" if the terminal does colors
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on

    highlight Cursor guifg=white guibg=black
    highlight iCursor guifg=white guibg=steelblue

    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkon0
    set guicursor+=i:blinkwait10
endif

" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

" trick to enable undo after Ctrl-u and Ctrl-w
" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" use Ctrl-l to clear search highlights
nnoremap <C-L> :nohlsearch<CR><C-L>

" more intuitive split opening
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" wean off of arrow keys...
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
