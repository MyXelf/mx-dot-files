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

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Folding
set foldenable
set foldcolumn=0
set foldtext=Fold_Text()
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

" Wrap lines at convenient points
set linebreak

" No wrap by default
set nowrap

" Enable autoindent
set smartindent

" Characters to use in List mode
set listchars=eol:◊,tab:→\ ,trail:۰,extends:»,precedes:«,nbsp:●

" Keywords
set iskeyword+=-

" Prevents two spaces after punctuation on a join
set nojoinspaces

" ----------------------------------------------------------------------------------------------------------------------
"  Visual
" ----------------------------------------------------------------------------------------------------------------------

" Better search
set ignorecase
set smartcase

" Command line completion
set wildmode=longest:full,full

" Insert mode completion
set completeopt=menu,longest,preview

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

" Status Line Format
set statusline=%<%f
set statusline+=\ %m\ %R%H\ %#StatusLineWarn#%{SL_Alert_Extra_Space_Tab()}%*
set statusline+=\ %=%-9(%03b-0x%02B%)
set statusline+=\ B#%-1n
set statusline+=\ [%{&ff}%{&fenc!=''?'.'.&fenc:''}%{&ft!=''?'.'.&ft:''}]
set statusline+=\ \ %10(%4l:%c%V%)\ [%LL\ -\ %P]

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

" Status Line alert Extra Characters {{
"
" Tabs are only alerted while ExpandTab is set
"
function! SL_Alert_Extra_Space_Tab()
  if !exists('b:sl_alert_extra_space_tab')
    if &modifiable
      let wspace = search('\s\+$', 'nw') != 0 ? '[$]' : ''
      let wtab   = &expandtab && search('\t\+', 'nw') != 0 ? '[→]' : ''
      let b:sl_alert_extra_space_tab = wspace . wtab
    else
      let b:sl_alert_extra_space_tab = ''
    endif
  endif
  return b:sl_alert_extra_space_tab
endfunction
" }}

" ----------------------------------------------------------------------------------------------------------------------
"  Filetype Detection
" ----------------------------------------------------------------------------------------------------------------------

" ----------------------------------------------------------------------------------------------------------------------
"  Plugins Settings
" ----------------------------------------------------------------------------------------------------------------------


" ----------------------------------------------------------------------------------------------------------------------
"  Dein :: Neovim Plugin Manager
" ----------------------------------------------------------------------------------------------------------------------

" Neovim Plugin Manager Base Path
let s:nvim_pm_base = $NVIM_BASE . '/bundle'

execute 'set runtimepath+=' . s:nvim_pm_base . '/repos/github.com/Shougo/dein.vim'

if dein#load_state(s:nvim_pm_base)
  call dein#begin(s:nvim_pm_base)

  " Dein handling Dein (Required!)
  call dein#add('Shougo/dein.vim')

  " Enabled Plugins {{
  " }}

  " Disabled Plugins {{
  " }}

  " Required by the Plugin Manager
  call dein#end()
  call dein#save_state()
endif

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
