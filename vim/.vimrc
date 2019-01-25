" Plugins
call plug#begin('~/.vim/plugged')
   " Niceties
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-repeat'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'mhinz/vim-startify'

    " Colors
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'
    Plug 'arcticicestudio/nord-vim'
    Plug 'altercation/vim-colors-solarized'
    Plug 'nanotech/jellybeans.vim'

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
    Plug 'w0rp/ale'
    Plug 'leafgarland/typescript-vim'
    Plug 'tomlion/vim-solidity'
    Plug 'rust-lang/rust.vim'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-lua-ftplugin'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer --rust-completer' } " need to install cmake for YCM
call plug#end()

" General
set encoding=UTF-8
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

let mapleader=";"

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>r :Rg!<CR>
nnoremap <Leader>gt :YcmCompleter GoTo<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <silent> <Leader><space> :nohlsearch<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>z :wq<CR>
nnoremap <Leader>v <C-w>v<CR>
nnoremap <Leader>s <C-w>s<CR>
nnoremap <Leader>e :Ex<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

if executable('ag')
   let g:ackprg = 'ag --vimgrep'
endif

" Look
set list
set listchars=tab:→\
set number relativenumber
set showcmd
set t_Co=256
syntax enable
colorscheme jellybeans

" Misc
" Enable YCM just for these files
let g:ycm_filetype_whitelist = {
    \ 'javascript': 1,
    \ 'javascript.jsx': 1,
    \ 'typescript': 1,
    \ 'rs': 1
\}

let g:startify_lists = [
  \ { 'type': 'dir', 'header': ['    MRU'] },
  \ { 'type': 'bookmarks', 'header': [    'Bookmarks'] },
\ ]

let g:startify_bookmarks = [ {'x': '~/.vimrc'}, {'z': '~/.zshrc'} ]

set diffopt+=vertical

" Disable YCM's preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" setup Rg command
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
         \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

