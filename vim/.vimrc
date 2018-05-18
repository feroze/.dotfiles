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
let g:airline_section_y = '' " Don't show file encoding details
" air-line
let g:airline_powerline_fonts = 1
" vim-airline customization

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

nmap ; :Buffers<CR> " press ; to see buffer list

Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif
" Use :Ack [options] {pattern} [{directories}]


" ---
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
" Add the list of wikis into ~/.vimrc_wikis using below syntax
" Use ,ww to open first wiki in list
if !empty(glob("~/.vimrc_wikis"))
  source ~/.vimrc_wikis
endif


" # Integrations for external apps

Plug 'tpope/vim-fugitive'
" Use :Gblame to see last change
" Use :Gstatus to see git status and press - to toggle staging of files
" Use :windo Gw to commit current file

Plug 'taketwo/vim-ros'
" Automagically enable :A to work for ros cpp

Plug 'airblade/vim-gitgutter'
"jump to next hunk (change): ]c
"jump to previous hunk (change): [c.
"You can stage or undo an individual hunk when your cursor is in it:
"stage the hunk with <Leader>hs or
"undo it with <Leader>hu.

Plug 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_complete_in_comments=1 " turn on completion in comments
"" load ycm conf by default
"let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1 " turn on tag completion
set completeopt-=preview " only show completion as a list instead of a sub-window
let g:ycm_min_num_of_chars_for_completion=1 " start completion from the first character
let g:ycm_cache_omnifunc=0 " don't cache completion items
let g:ycm_seed_identifiers_with_syntax=1 " complete syntax keywords

Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

Plug 'mzlogin/vim-markdown-toc'

"Plug 'mhinz/vim-startify'

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
au BufNewFile,BufFilePre,BufRead *.md,*.txt set filetype=markdown " local hack to enable dropbox edit
au BufNewFile,BufFilePre,BufRead *.xtx set filetype=tex
au BufNewFile,BufFilePre,BufRead *.bashrc set filetype=sh
au BufNewFile,BufReadPost *.ino,*.pde,*.tpp set filetype=cpp

" Wrap text for certain filetypes
au BufRead,BufNewFile *.tex,*.wiki,*.md,*.txt setlocal textwidth=80

" different indent settings for python
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
