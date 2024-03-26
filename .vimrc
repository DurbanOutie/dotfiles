" echo ">^.^<"

nnoremap <space> <nop>
let mapleader = "\<space>"

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <down> <nop>
nnoremap <up> <nop>

inoremap jk <esc>
inoremap <esc> <nop>

set laststatus=2

set statusline=%.20F
set statusline+=\
set statusline+=Type:%Y
set statusline+=%=
set statusline+=[%f\ -\ %n]
set statusline+=\ Line:\ %l/%L

set nu rnu

nnoremap <leader>bp :!./build.sh<cr>
nnoremap <leader>bip :r!./build.sh<cr>
nnoremap <leader>rp :!./run.sh<cr>
nnoremap <leader>rip :r!./run.sh<cr>

" Tab settings for coding
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" when scrolling, Center the cursor
set scrolloff=999

syntax on

" guideline for coding
set colorcolumn=81
highlight ColorColumn ctermbg=242
