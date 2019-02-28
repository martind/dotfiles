call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-repeat'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'mhinz/vim-startify'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'
    Plug 'arcticicestudio/nord-vim'
    Plug 'altercation/vim-colors-solarized'
    Plug 'nanotech/jellybeans.vim'
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'mileszs/ack.vim'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    Plug 'w0rp/ale'
    Plug 'leafgarland/typescript-vim'
    Plug 'tomlion/vim-solidity'
    Plug 'rust-lang/rust.vim'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-lua-ftplugin'
    " Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer --rust-completer' } " need to install cmake for YCM
call plug#end()

set encoding=UTF-8
set nocompatible
set noswapfile
set nobackup
set nowritebackup
set mouse=a
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set incsearch
set hlsearch
set nowrap
set clipboard=unnamed
set list
set listchars=tab:>\ ,trail:·,extends:>,precedes:<,nbsp:+
set showcmd
set t_Co=256
set background=light
colorscheme PaperColor
syntax on
filetype plugin indent on

" Gdiff starts vertical
set diffopt+=vertical

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

let g:startify_lists = [
  \ { 'type': 'dir', 'header': ['    MRU'] },
  \ { 'type': 'bookmarks', 'header': [    'Bookmarks'] },
\ ]

let g:startify_bookmarks = [ {'x': '~/.vimrc'}, {'z': '~/.zshrc'} ]

" setup Rg command with preview
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
         \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

