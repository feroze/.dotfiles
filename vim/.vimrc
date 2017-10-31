set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" Comment plugin
Plugin 'scrooloose/nerdcommenter'

" For solarized
Plugin 'altercation/vim-colors-solarized.git'

" Ctrl P
Plugin 'ctrlpvim/ctrlp.vim'

" Fugitive
Plugin 'tpope/vim-fugitive.git'

" Surround
Plugin 'tpope/vim-surround.git'

" Autocomplete
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
Plugin 'Valloric/YouCompleteMe'

" a.vim for fast file switching
Plugin 'a.vim'

" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" tagbar - displays all the class names in rhs. Press F8 to display
" tagbar to make it look like Sublime
Plugin 'majutsushi/tagbar'

" Syntastic - syntax Cpp validator
Plugin 'scrooloose/syntastic'

" Sleuth to heuristically set file indendation options
"Plugin 'tpop/vim-sleuth'

" Makes latex editing much faster
" Vimtex
Plugin 'lervag/vimtex'

" Install clang formatter
Plugin 'rhysd/vim-clang-format'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable solarized scheme
syntax enable
let g:solarized_termcolors=256
colorscheme solarized
set background=light
set t_Co=256

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
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" execute cpp
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ -std=c++11 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>

" Create swap files in a different tmp directory
set directory^=$HOME/.vim/tmp//

" Ignore object files for ctrl-P
set wildignore+=*.so,*.swp,*.zip,*.o     " MacOSX/Linux

" To change directory to current file
autocmd BufEnter * silent! lcd %:p:h

" Navigate split windows with Ctrl + hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Recognize .md files as markdown
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Recognize .xtx files as latex
au BufNewFile,BufFilePre,BufRead *.xtx set filetype=tex

" Recognize .bashrc files as sh
au BufNewFile,BufFilePre,BufRead *.bashrc set filetype=sh


" Recognize .bashrc files as sh
au BufNewFile,BufFilePre,BufRead *.xtx set filetype=tex

" Recognize arduino and .tpp files as cpp
autocmd BufNewFile,BufReadPost *.ino,*.pde,*.tpp set filetype=cpp

" Enable code folding
set foldmethod=syntax
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
set mouse=a
"let c_no_comment_fold=1 "dont fold comments

set hlsearch " allows you to search for word under curso with*

" <F3> redraws the screen and removes any search highlighting.
nnoremap <F3> :set hlsearch!<CR>

" Delete buffer without closing script
nnoremap <C-c> :bp\|bd #<CR>

let g:ctrlp_switch_buffer = 't'

" Map F8 to start Tagbar
nmap <F8> :TagbarToggle<CR>

" Use X clipboard system for peace
set clipboard=unnamedplus

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" show cpp documentation using cppman by pressing Shift + K
autocmd FileType cpp set keywordprg=cppman

" This is for vimtex to work nicely with latexmk
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = "zathura"

" Use ctags with CtrlP to jump fast
nnoremap <leader>. :CtrlPTag<cr>


let g:ycm_global_ycm_extra_conf = '~/.dotfiles/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1

set tags=tags;/

" Provide list of definitions to jump to if multiple. Else, jump to one
nnoremap <C-]> g<C-]>


" use ctrlP to jump to defintinions
nnoremap <leader>. :CtrlPTag<cr>
