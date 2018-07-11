" Plugins
call plug#begin('~/.vim/plugged')
   " Niceties
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-sleuth'
    Plug 'morhetz/gruvbox'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-repeat'

    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    " Fuzzyness
    Plug 'mileszs/ack.vim'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'

    " Languages
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    Plug 'leafgarland/typescript-vim'
    Plug 'tomlion/vim-solidity'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer --cs-completer' } " need to install cmake for YCM
call plug#end()

" General
set nocompatible
set noswapfile
set nobackup
set nowritebackup
set mouse=a

" Behaviour
set ignorecase
set smartcase
set incsearch
set hlsearch
set nowrap
set clipboard=unnamed

let mapleader=","

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>a :Ag!<CR>

nnoremap <Leader>gt :YcmCompleter GoTo<CR>

nnoremap <Leader>t :tabnew<CR>
nnoremap <silent> <Leader><space> :nohlsearch<CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>z :wq<CR>

nnoremap <Leader>v <C-w>v<CR>
nnoremap <Leader>s <C-w>s<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

if executable('ag')
   let g:ackprg = 'ag --vimgrep'
endif

" Look
set list
set listchars=tab:→\ ,space:·
syntax enable
set number relativenumber
set showcmd
set t_Co=256
set background=dark
colorscheme gruvbox

" Misc
" Enable YCM just for these files
let g:ycm_filetype_whitelist = {
    \ 'javascript': 1,
    \ 'javascript.jsx': 1,
    \ 'typescript': 1,
    \ 'cs': 1
\}

" Disable YCM's preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" Setup Ag with preview
command! -bang -nargs=* Ag
         \ call fzf#vim#ag(<q-args>,
         \                 <bang>0 ? fzf#vim#with_preview('up:60%')
         \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
         \                 <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
         \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

