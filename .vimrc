set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" Git plugin
Plugin 'tpope/vim-fugitive'

" Comment plugin
Plugin 'scrooloose/nerdcommenter'

" For solarized
Plugin 'altercation/vim-colors-solarized.git'

" Ctrl P
Plugin 'ctrlpvim/ctrlp.vim'

" Autocomplete
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
Plugin 'Valloric/YouCompleteMe'

" vim-tmux-navigator
Plugin 'christoomey/vim-tmux-navigator'

" a.vim for fast file switching
Plugin 'a.vim'

" ack for searching
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable solarized scheme
syntax enable
"set background=dark
let g:solarized_termcolors=256
set t_Co=256
colorscheme solarized

syntax enable             " enable syntax highlighting (previously syntax on).
set number                " show line numbers
set laststatus=2          " last window always has a statusline

set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text

let mapleader=","         " set comma as leaderkey for nerdcommenter

" different indent settings for python 
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" for YouCompleteMe
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" execute cpp
" autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

" Create swap files in a different tmp directory
set directory^=$HOME/.vim/tmp//

" Ignore object files for ctrl-P
set wildignore+=*.so,*.swp,*.zip,*.o     " MacOSX/Linux

" swap semicolon and colon - evil. don't do!
"nnoremap ; :
"nnoremap : ;

" To change directory to current file
autocmd BufEnter * silent! lcd %:p:h

" Navigate split windows with Ctrl + hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Recognize .md files as markdown
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Recognize arduino and .tpp files as cpp
autocmd BufNewFile,BufReadPost *.ino,*.pde,*.tpp set filetype=cpp

" Enable code folding
set foldmethod=syntax
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
set mouse=a
"let c_no_comment_fold=1 "dont fold comments
