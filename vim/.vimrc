set nocompatible              " be iMproved, required

" Automatically install vim-plug plugin-manager
" NOTE: Does not work behind proxy
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs --insecure
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(expand('~/.vim/plugged')) " Put all plugin loads here

" # Language

Plug 'scrooloose/nerdcommenter'
" ,cc to comment and uncomment lines

Plug 'lervag/vimtex'
" Use \ll to autorun latex commands using latexmk
" You still need latexmkrc

" # interface and IDE elements

Plug 'majutsushi/tagbar'
" Press F8 to display method names and tags

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Automatic status line

Plug 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
set background=light
set t_Co=256

" # Code display and prettifying
Plug 'bronson/vim-trailing-whitespace'
" Automatically highlights trailing whitespace
" Call :FixWhitespace to fix everything

" # Source code navigation

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
" Both options are optional. You don't have to install fzf in ~/.fzf
" and you don't have to run install script if you use fzf only in Vim.
" Use :Files to search for files
" Use :Commits to search for commits using fugitive

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" If :ProjectFiles is called, set git project root as pwd to help search better
command! ProjectFiles execute 'Files' s:find_git_root()
" Assign Ctrl-P to it
nnoremap <C-p> :ProjectFiles<CR>

Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag'
endif
" Use :Ack [options] {pattern} [{directories}]


" ---
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
" Add the list of wikis into ~/.vimrc_wikis using below syntax
"let g:vimwiki_list = [
"                        \{'path': '~/wiki1/', 'syntax': 'markdown'},
"                        \{'path': '~/wiki2/', 'syntax': 'markdown'},
"                \]

" Use ,ww to open first wiki in list
if !empty(glob("~/.vimrc_wikis"))
  source ~/.vimrc_wikis
endif

" # Integrations for external apps

Plug 'tpope/vim-fugitive'
" Use :Gblame to see last change
" Use :Gstatus to see git status and press - to toggle staging of files

Plug 'taketwo/vim-ros'
" Automagically enable :A to work

Plug 'airblade/vim-gitgutter'
"jump to next hunk (change): ]c
"jump to previous hunk (change): [c.
"You can stage or undo an individual hunk when your cursor is in it:
"stage the hunk with <Leader>hs or
"undo it with <Leader>hu.

"Plug 'Valloric/YouCompleteMe'

call plug#end() " End of plugin loads

colorscheme solarized " Needs to be after plug loads everything

" Display settings

set number                " show line numbers
set ruler                 " Always show info along bottom.
set laststatus=2          " last window always has a statusline

" Current buffer search settings

set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set hlsearch " allows you to search for word under curso with*
set ignorecase            " Make searches case-insensitive.
nnoremap <F3> :set hlsearch!<CR> " <F3> redraws the screen and removes any search highlighting.

" Code/text settings

set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 4 columns
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
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.xtx set filetype=tex
au BufNewFile,BufFilePre,BufRead *.xtx set filetype=tex
au BufNewFile,BufFilePre,BufRead *.bashrc set filetype=sh
au BufNewFile,BufReadPost *.ino,*.pde,*.tpp set filetype=cpp

" Wrap text for certain filetypes
au BufRead,BufNewFile *.tex,*.wiki,*.md setlocal textwidth=80

" different indent settings for python
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
