if filereadable(glob('~/.exrc'))
    source ~/.exrc
endif

set nocompatible    " no vi compatibility mode

set showcmd         " info about ongoing cmd, e.g. selection dimensions
set laststatus=2    " display status line always

set backspace=indent,eol,start

set nobackup

set incsearch       " incremental search
set hlsearch        " highlight matches
set smartcase       " in search

set completeopt=longest,menuone

set wildmode=longest,list,full
set wildmenu

set history=10000

set nowrap

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


" trick to enable undo after Ctrl-u and Ctrl-w
" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" use Ctrl-l to clear search highlights
nnoremap <C-L> :nohlsearch<CR><C-L>