"
"  Script:    MX Neovim RC
"
"  Author:    Juan J Gonzalez Cardenas [Jota Jota] - <https://github.com/MyXelf/mx-dot-files>
"  Version:   2.0
"  Date:      07.Aug.2017
"
"  Legal:     Copyright (c) 2011-2017. Licensed under the MIT license.
"
"  History:                                                                   {{
"             07.Aug.2017     v2.0
"                           * Initial Migration from Vim to Neovim
"
"
" }}


" ----------------------------------------------------------------------------------------------------------------------
"  Global Configuration
" ----------------------------------------------------------------------------------------------------------------------

" Variables Declarations {{

" Neovim Base Path
let $NVIM_BASE = fnamemodify(expand($MYVIMRC), ':h')

" Neovim RC :: Main
let $NVIMRC_MAIN = $MYVIMRC

" Neovim RC :: Local
let $NVIMRC_LOCAL = $MYVIMRC . '.local'

" }}

" Change all Leaders to <SPACE>
let mapleader = " "
let maplocalleader = " "

" ----------------------------------------------------------------------------------------------------------------------
"  UI Configuration
" ----------------------------------------------------------------------------------------------------------------------

" True Color (24-bit) support
set termguicolors

" Dark Background
set background=dark

" Color Scheme
colorscheme mx_black

" ----------------------------------------------------------------------------------------------------------------------
"  Formatting
" ----------------------------------------------------------------------------------------------------------------------

" Turn on syntax highlighting
syntax on

" Turn off automatic file type detection (will be activated at the end)
filetype off

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

" Folding
set foldenable
set foldcolumn=0
set foldtext=Fold_Text()
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

" Wrap lines at convenient points
set linebreak

" No wrap by default
set nowrap

" Allow backspacing over everything in Insert mode
set backspace=indent,eol,start

" Enable autoindent
set autoindent
set smartindent

" Characters to use in List mode
set listchars=eol:◊,tab:→\ ,trail:۰,extends:»,precedes:«,nbsp:●

" Keywords
set iskeyword+=-

" Remove comment leader when joining lines
set formatoptions+=j

" Prevents two spaces after punctuation on a join
set nojoinspaces

" ----------------------------------------------------------------------------------------------------------------------
"  Visual
" ----------------------------------------------------------------------------------------------------------------------

" Better search
set hlsearch
set ignorecase
set smartcase
set incsearch

" Use wildmenu for better command-line completion
set wildmenu

" Command line completion
set wildmode=longest:full,full

" Insert mode completion
set completeopt=menu,longest,preview

" Display incomplete commands
set showcmd

" Show current mode
set showmode

" Don't redraw screen
set lazyredraw

" Lines to keep on top and bottom on scroll
set scrolloff=2

" Change the time used to wait for user input on mappings
set timeoutlen=500

" Allow unsaved buffers to be put in the background
set hidden

" Allow the cursor to go into _invalid_ places
set virtualedit=all

" History size
set history=1000

" Always show the status line
set laststatus=2

" ----------------------------------------------------------------------------------------------------------------------
"  Windows
" ----------------------------------------------------------------------------------------------------------------------

" Split windows to below and right
set splitbelow splitright

" Filling chars
set fillchars=stl:\ ,stlnc:\ ,vert:\ ,fold:\ ,diff:-

" ----------------------------------------------------------------------------------------------------------------------
"  ShaDa :: Views :: Sessions :: Swapfiles
" ----------------------------------------------------------------------------------------------------------------------

" Sessions
set sessionoptions-=options


" ----------------------------------------------------------------------------------------------------------------------
"  Global Abbreviations
" ----------------------------------------------------------------------------------------------------------------------

ab <expr> dn strftime('%d.%b.%Y')
ab        dt dd.mmm.yyyy

" ----------------------------------------------------------------------------------------------------------------------
"  Global Mappings
" ----------------------------------------------------------------------------------------------------------------------

" Wrapped lines goes down/up to next row, rather than next line in file
nnoremap j gj
nnoremap k gk

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" ----------------------------------------------------------------------------------------------------------------------
"  Leader Mappings
" ----------------------------------------------------------------------------------------------------------------------


" ----------------------------------------------------------------------------------------------------------------------
"  Auto Commands
" ----------------------------------------------------------------------------------------------------------------------


" ----------------------------------------------------------------------------------------------------------------------
"  Commands
" ----------------------------------------------------------------------------------------------------------------------


" ----------------------------------------------------------------------------------------------------------------------
"  Functions
" ----------------------------------------------------------------------------------------------------------------------


" ----------------------------------------------------------------------------------------------------------------------
"  Filetype Detection
" ----------------------------------------------------------------------------------------------------------------------


" ----------------------------------------------------------------------------------------------------------------------
"  Dein :: Neovim Plugin Manager
" ----------------------------------------------------------------------------------------------------------------------
" {{

" Neovim Plugin Manager Base Path
let s:nvim_pm_base = $NVIM_BASE . '/bundle'

execute 'set runtimepath+=' . s:nvim_pm_base . '/repos/github.com/Shougo/dein.vim'

if dein#load_state(s:nvim_pm_base)
  call dein#begin(s:nvim_pm_base)

  " Dein handling Dein (Required!)
  call dein#add('Shougo/dein.vim')

  " Required by the Plugin Manager
  call dein#end()
  call dein#save_state()
endif

" }}

" ----------------------------------------------------------------------------------------------------------------------
"  Plugins Settings
" ----------------------------------------------------------------------------------------------------------------------


" ----------------------------------------------------------------------------------------------------------------------
"  Neovim Local RC
" ----------------------------------------------------------------------------------------------------------------------

if filereadable($NVIMRC_LOCAL)
  source $NVIMRC_LOCAL
endif

" ----------------------------------------------------------------------------------------------------------------------
"  Sandbox Playground
" ----------------------------------------------------------------------------------------------------------------------


" vim: set tw=120 fdm=marker fmr={{,}} fdl=0:
