set nocompatible              " be iMproved, required

" Automatically install vim-plug plugin-manager
" NOTE: Does not work behind proxy
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs --insecure
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(expand('~/.vim/plugged')) " Put all plugin loads here

Plug 'scrooloose/nerdcommenter'
" ,cc to comment and uncomment lines

Plug 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
set background=light
set t_Co=256

call plug#end() " End of plugin loads

colorscheme solarized " Needs to be after plug loads everything

" Display settings

set number                " show line numbers
set ruler                 " Always show info along bottom.
set laststatus=2          " last window always has a statusline

" Current buffer search settings

set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set hlsearch " allows you to search for word under cursor with *
set ignorecase            " Make searches case-insensitive.
nnoremap <F3> :set hlsearch!<CR> " <F3> toggles search highlighting.

" Code/text settings

set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
set mouse=a               " Enable mouse in all modes

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Vim navigation settings

let mapleader=","         " set comma as leaderkey for nerdcommenter

" Navigate split windows with Ctrl + hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" vim settings

set directory^=$HOME/.vim/swapfiles// " Create swap files in a different tmp directory
set clipboard^=unnamed,unnamedplus  " Use X system clipboard directly for peace of mind

" Filetype specific settings

" Associate filetypes correctly
au BufNewFile,BufFilePre,BufRead *.md,*.txt set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.xtx set filetype=tex
au BufNewFile,BufFilePre,BufRead *.bashrc set filetype=sh
au BufNewFile,BufReadPost *.ino,*.pde,*.tpp set filetype=cpp

" Wrap text for certain filetypes
au BufRead,BufNewFile *.tex,*.wiki,*.md,*.txt setlocal textwidth=80

" different indent settings for python
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Firefox like cycling through vim buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

set backspace=indent,eol,start

" Map ,cd to change directory to current buffer's
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
