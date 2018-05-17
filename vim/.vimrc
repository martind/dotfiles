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

    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    " Fuzzyness
    Plug 'mileszs/ack.vim'
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
set ignorecase
set smartcase
set incsearch
set hlsearch
set nowrap

let mapleader=","

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>a :Ag!<CR>
nnoremap <Leader>gt :YcmCompleter GoTo<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <silent> <Leader><space> :nohlsearch<CR>

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
    \ 'javascript.jsx': 1
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
