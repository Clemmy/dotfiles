""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Configurations
" Author       : Clement Hoang
" Last Changed : March 26th, 2017
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

let mapleader="," " Remap the leader key

filetype off " Required for Plug
filetype plugin on
filetype indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'godlygeek/tabular'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'heavenshell/vim-jsdoc'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
Plug 'joshdick/onedark.vim'

call plug#end() " Plugins must be added before this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOURS AND FONTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 > "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax enable
colorscheme onedark

let g:airline_theme='onedark'

" Use 256 colours in the terminal
set t_Co=256

if has("gui_running")
  
  " Set the font to Source Code Pro at 14px
  set guifont=Source\ Code\ Pro:h15

  " Remove scroll bars from GUI
  set guioptions-=rL
  
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TABS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent
set expandtab " Tabs are now spaces
set tabstop=2 " # of visual spaces per tab
set softtabstop=2 " # of spaces in a tab when editing
set shiftwidth=2 " Number of spaces when performing shift+>>
set colorcolumn=80 " Show a column



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch " Search as characters are typed
set hlsearch " Highlight search queries
set lazyredraw " Redraw only when required (for performance)
set ignorecase " Ignore case when searching
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* " Ignore version control

" Turn off search highlight
noremap <leader><space> :nohl<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FOLDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BUFFERS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Unsaved buffers are allowed to go into the background
set hidden

" Open a new empty buffer
nmap <leader>t :enew<CR>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>bq :bprevious <Bar> bd #<CR> 

" List all current buffers and their status
nmap <leader>bl :ls<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number " Turn on line numbering
set showcmd " Show command at the bottom
set showmatch " Show matching brace
set mousehide " Hide the mouse when typing
set autoread " Auto read file when changed from outside

" Disable the fucking beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM-AIRLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTE: For glyphs to show up in the terminal, a patched font must be used.
" EXAMPLE: Source Code Pro

set laststatus=2 " Required for Airline

set encoding=utf-8 " Needed for glpyhs

let g:airline_theme='onedark'

let g:airline_powerline_fonts=1

" Show the list of buffers
let g:airline#extensions#tabline#enabled=1

" Show just the filename
let g:airline#extensions#tabline#fnamemod=':t' 

" Show the buffer number
let g:airline#extensions#tabline#buffer_nr_show=1

" Remove whitespace checks
let g:airline#extensions#whitespace#checks=[]



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRL-P
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use this option to change the mapping to invoke CtrlP in Normal Mode
let g:ctrlp_map='<C-p>'

" Set the default opening command to use when pressing the above mapping
let g:ctrlp_cmd='CtrlP'

" Custom ignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTREE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle NERDTree
nmap <leader>\ :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCOMMENTER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Add 1 space after comment delimiters
let g:NERDSpaceDelims = 1
