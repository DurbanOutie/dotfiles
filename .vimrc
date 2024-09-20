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

set clipboard=unnamedplus

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


" Navigation
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>



" build and run scripts for projects
nnoremap <leader>bp :!./build.sh<cr>
nnoremap <leader>bip :r!./build.sh<cr>
nnoremap <leader>rp :!./run.sh<cr>
nnoremap <leader>rip :r!./run.sh<cr>

" Vim Plug manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim plug
call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'

" OpenGL - Syntax HL
Plug 'tikhomirov/vim-glsl'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" AutoComplete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()


" LSP Hook
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

let g:asyncomplete_min_chars = 2












