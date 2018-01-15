"
"  Script:    MX Neovim RC
"
"  Author:    Juan J Gonzalez Cardenas [Jota Jota] - <https://github.com/MyXelf/mx-dot-files>
"  Version:   2.0
"  Date:      03.Jan.2018
"
"  Legal:     Copyright (c) 2011-2018. Licensed under the MIT license.
"

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

" Neovim Storage Base
let $NVIM_BASE_STORAGE = $NVIM_BASE . '/storage'

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
"  ShaDa :: Swap Files :: Remote Plugin :: Sessions :: Views
" ----------------------------------------------------------------------------------------------------------------------

" ShaDa
set shada+=n$NVIM_BASE_STORAGE/shada/main.shada

" Swap Files
set directory=$NVIM_BASE_STORAGE/swap//

" Remote Plugin
let $NVIM_RPLUGIN_MANIFEST = $NVIM_BASE_STORAGE . '/rplugin/rplugin'

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

" Toggle Folding
nmap <silent> , za
vmap <silent> , za

" ----------------------------------------------------------------------------------------------------------------------
"  Leader Mappings
" ----------------------------------------------------------------------------------------------------------------------

" Plugin :: ALE
nmap <silent> <leader>tk    :ALEToggleBuffer \| call Echo('Buffer Syntax Check Mode [ALE]: ' . (b:ale_enabled ? 'Enabled' : 'Disabled'))<CR>

" Plugin :: Fugitive
nmap <silent> <leader>gd    :Gdiff<CR>
nmap <silent> <leader>gs    :Gstatus<CR>
vmap <silent> <leader>dg    :diffget \| diffupdate<CR>
vmap <silent> <leader>dp    :diffput \| diffupdate<CR>

" ----------------------------------------------------------------------------------------------------------------------
"  Auto Commands
" ----------------------------------------------------------------------------------------------------------------------

" Plugin :: ALE {{
  augroup ale_filetype_user
    autocmd!
    autocmd FileType                   *                             ALEDisableBuffer
    autocmd User                       ALELint                       call lightline#update()
  augroup end
" }}

" ----------------------------------------------------------------------------------------------------------------------
"  Commands
" ----------------------------------------------------------------------------------------------------------------------


" ----------------------------------------------------------------------------------------------------------------------
"  Functions
" ----------------------------------------------------------------------------------------------------------------------

" Echo with Highlighting {{
"
function! Echo(message)
  echohl ModeMsg | echo '--' a:message '--' | echohl None
endfunction
" }}

" Fold Text {{
"
function! Fold_Text()
  " Get first line, remove fold_markers and trailing spaces
  let fhead = substitute(getline(v:foldstart), '\s*\(' . substitute(&fmr, ',', '\\|', '') . '\)\d\=', '', 'g')
  let ftail = ' ── ' . (v:foldend - v:foldstart + 1) . ' Lns ★  ' . v:foldlevel . ' ── '
  let stail = strchars(ftail)

  if winwidth(0) < &tw || !&tw
    let size = winwidth(0) - &fdc - &nuw * &nu
  else
    let size = &tw
  endif

  return printf("%*s%s", -size + stail, fhead, ftail)
endfunction
" }}

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
    call dein#add('itchyny/lightline.vim', { 'hook_add': 'set noshowmode' })
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-unimpaired')
    call dein#add('w0rp/ale')
  " }}

  " Disabled Plugins {{
  " }}

  " Required by the Plugin Manager
  call dein#end()
  call dein#save_state()
endif

" ----------------------------------------------------------------------------------------------------------------------
"  Plugins Settings
" ----------------------------------------------------------------------------------------------------------------------

" LightLine {{

  " Status Line Configuration {{
  let g:lightline = {
    \   'colorscheme': 'mx_black',
    \
    \   'enable': {
    \     'statusline': 1,
    \     'tabline': 1,
    \   },
    \
    \   'active': {
    \     'left': [
    \       ['mode', 'paste'],
    \       ['fugitive'],
    \       ['readonly', 'filename'],
    \     ],
    \     'right': [
    \       ['linter_e', 'linter_w', 'linter_ok'],
    \       ['lineinfo'],
    \       ['file_fet'],
    \       ['charinfo'],
    \       ['alert_st'],
    \     ]
    \   },
    \
    \   'inactive': {
    \     'left': [
    \       ['mode'],
    \       ['readonly', 'filename'],
    \     ],
    \     'right': [
    \       ['lineinfo'],
    \       ['file_fet'],
    \     ]
    \   },
    \
    \   'component': {
    \     'charinfo': '%8(%03b-0x%02B%)',
    \     'file_fet': '%{&ff}%{&fenc != "" ? "  ○ " . &fenc : ""}%{&ft != "" ? "  ○ " . &ft : ""}',
    \     'lineinfo': '%8(%4l:%-3v%)  %L ☰ %P',
    \     'alert_st': '%#StatusLineWarn#%{SL_Alert_Extra_Space_Tab()}%*',
    \   },
    \
    \   'component_function': {
    \     'mode':     'LightLine_Mode',
    \     'fugitive': 'LightLine_Fugitive',
    \     'filename': 'LightLine_Filename_Modified',
    \     'readonly': 'LightLine_ReadOnly',
    \   },
    \
    \   'component_type': {
    \     'readonly': 'raw',
    \     'linter_w': 'warning',
    \     'linter_e': 'error',
    \   },
    \
    \   'mode_map': {
    \     'n': 'N',
    \     'i': 'I',
    \     'R': 'R',
    \     'v': 'V',
    \     'V': 'L',
    \     'c': 'CMD',
    \     's': 'SELECT',
    \     'S': 'S-LINE',
    \     't': 'TERMINAL',
    \     "\<C-v>": 'B',
    \     "\<C-s>": 'S-B',
    \   },
    \
    \   'separator':    { 'left': '', 'right': '' },
    \   'subseparator': { 'left': '', 'right': '' },
    \ }
  " }}

  " Tab Line Configuration {{
  let g:lightline_tabline = {
    \   'tabline_separator':    { 'left': '', 'right': '' },
    \   'tabline_subseparator': { 'left': '', 'right': '' },
    \ }
  " }}

  " Merge Status Line and Tab Line configuration {{
  call extend(g:lightline, g:lightline_tabline)
  " }}

  " LightLine Components Functions {{

    " LightLine_Mode {{
    function! LightLine_Mode()
      if exists('*win_getid') && exists('*getwininfo')
        let dict = getwininfo(win_getid())
        if len(dict) > 0 && get(dict[0], 'quickfix', 0)
          return get(dict[0], 'loclist', 0) ? 'Location' : 'QuickFix'
        endif
      endif

      let fname = expand('%:t')
      return &buftype == 'quickfix' ? 'QFix/Loc' :
        \ fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'help' ? 'Help' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ &previewwindow ? 'Preview' : lightline#mode()
    endfunction
    " }}

    " LightLine_Fugitive {{
    function! LightLine_Fugitive()
      if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ' ' . branch : ''
      endif
      return ''
    endfunction
    " }}

    " LightLine_Filename_Modified {{
    function! LightLine_Filename_Modified()
      let fname = expand('%:t')
      let fresult = &buftype == 'quickfix' ? '' :
        \ fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ (fname != '' ? fname : '[No Name]')
      let wmodify = &modified ? '●' : &modifiable ? '' : '-'
      return fresult . ' ' . wmodify
    endfunction
    " }}

    " LightLine_ReadOnly {{
    function! LightLine_ReadOnly()
      return &readonly ? ' ' : ''
    endfunction
    " }}

    " LightLine_Reload {{
    function! LightLine_Reload()
      call lightline#init()
      call lightline#colorscheme()
      call lightline#update()
    endfunction
    " }}

  " }}

" }}

" ALE {{

  " LightLine Integration {{

    " Status Line Sections {{
    let g:lightline.component_expand = {
      \  'linter_ok': 'LightLine_Linter_OK',
      \  'linter_w':  'LightLine_Linter_Warnings',
      \  'linter_e':  'LightLine_Linter_Errors',
      \ }
    " }}

    " LightLine_Linter_OK {{
    function! LightLine_Linter_OK() abort
      if get(g:, 'ale_enabled', 0) && get(b:, 'ale_enabled', 0)
        let l:counts = ale#statusline#Count(bufnr(''))
        return l:counts.total == 0 ? '✔' : ''
      endif
      return ''
    endfunction
    " }}

    " LightLine_Linter_Warnings {{
    function! LightLine_Linter_Warnings() abort
      let l:counts = ale#statusline#Count(bufnr(''))
      let l:all_non_errors = l:counts.total - (l:counts.error + l:counts.style_error)
      return l:all_non_errors == 0 ? '' : 'W:' . all_non_errors
    endfunction
    " }}

    " LightLine_Linter_Errors {{
    function! LightLine_Linter_Errors() abort
      let l:counts = ale#statusline#Count(bufnr(''))
      let l:all_errors = l:counts.error + l:counts.style_error
      return l:all_errors == 0 ? '' : 'E:' . all_errors
    endfunction
    " }}

  " }}

  let g:ale_sign_error = '✘'
  let g:ale_sign_warning = 'Δ'

  let g:ale_echo_msg_info_str    = 'I'
  let g:ale_echo_msg_error_str   = 'E'
  let g:ale_echo_msg_warning_str = 'W'
  let g:ale_echo_msg_format      = '[%severity%] <%linter%> %(code) %:: %s'
" }}

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
