" Plugins
call plug#begin('~/.vim/plugged')
   " Niceties
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'morhetz/gruvbox'

    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    " FZF
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'

    " I blame Crockford for this!
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer' } " need to install cmake for YCM
call plug#end()

" General
set nocompatible
set noswapfile
set nobackup
set nowritebackup
set mouse=a

" Behaviour
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Look
set list
set listchars=tab:→\ ,space:·
syntax enable
set number relativenumber
set showcmd
set background=dark
colorscheme gruvbox

" Misc
let g:ycm_filetype_whitelist = {
    \ 'javascript': 1,
    \ 'javascript.jsx': 1
\}

