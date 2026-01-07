"
"  Script:    mx_black.vim
"
"  Author:    Juan J González Cárdenas [Jota Jota] - <https://github.com/MyXelf/mx-dot-files>
"  Version:   1.0
"  Date:      03.Jan.2018
"
"  Legal:     Copyright © 2014-2026. Licensed under the MIT license.
"

" TODO: Include the following Highlight Groups:
" Highlight groups:
"  |hl-QuickFixLine|
"  |hl-Substitute|
"  |hl-TermCursor|
"  |hl-TermCursorNC|
"  |hl-Whitespace| highlights 'listchars' whitespace

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "mx_black"


" General Colors
hi Normal           guifg=#B2B2B2     guibg=black       gui=NONE            ctermfg=gray        ctermbg=NONE        cterm=NONE
hi NonText          guifg=#666666     guibg=NONE        gui=NONE            ctermfg=black       ctermbg=NONE        cterm=BOLD
hi SpecialKey       guifg=#666666     guibg=NONE        gui=NONE            ctermfg=black       ctermbg=NONE        cterm=BOLD

hi Cursor           guifg=black       guibg=white       gui=NONE            ctermfg=black       ctermbg=white       cterm=reverse
hi LineNr           guifg=#3D3D3D     guibg=black       gui=NONE            ctermfg=darkgray    ctermbg=NONE        cterm=NONE

hi VertSplit        guifg=#202020     guibg=#202020     gui=NONE            ctermfg=white       ctermbg=black       cterm=BOLD
hi StatusLine       guifg=#FFFFFF     guibg=#202020     gui=NONE            ctermfg=white       ctermbg=black       cterm=BOLD
hi StatusLineNC     guifg=#666666     guibg=#202020     gui=NONE            ctermfg=black       ctermbg=black       cterm=BOLD,reverse
hi ModeMsg          guifg=yellow      guibg=black       gui=BOLD            ctermfg=yellow      ctermbg=NONE        cterm=BOLD
hi MoreMsg          guifg=yellow      guibg=black       gui=BOLD            ctermfg=yellow      ctermbg=NONE        cterm=BOLD

hi Folded           guifg=#F0F0F0     guibg=#161616     gui=NONE            ctermfg=white       ctermbg=black       cterm=BOLD
hi FoldColumn       guifg=#666666     guibg=#0A0A0A     gui=NONE            ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Title            guifg=#F6F3E8     guibg=NONE        gui=BOLD            ctermfg=white       ctermbg=NONE        cterm=BOLD
hi Visual           guifg=NONE        guibg=#262D51     gui=NONE            ctermfg=NONE        ctermbg=NONE        cterm=reverse

hi WildMenu         guifg=black       guibg=yellow      gui=NONE            ctermfg=black       ctermbg=yellow      cterm=NONE
hi PmenuSbar        guifg=black       guibg=white       gui=NONE            ctermfg=black       ctermbg=white       cterm=NONE
hi Ignore           guifg=gray        guibg=black       gui=NONE            ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi Error            guifg=darkred     guibg=NONE        gui=BOLD            ctermfg=white       ctermbg=red         cterm=BOLD     guisp=#FF6C60 " undercurl color
hi ErrorMsg         guifg=white       guibg=#FF0000     gui=BOLD            ctermfg=white       ctermbg=red         cterm=BOLD
hi WarningMsg       guifg=white       guibg=#FF0000     gui=BOLD            ctermfg=white       ctermbg=red         cterm=BOLD
hi LongLineWarning  guifg=NONE        guibg=#371F1C     gui=underline       ctermfg=NONE        ctermbg=NONE        cterm=underline

" Syntax Highlighting
hi Comment          guifg=#7C7C7C     guibg=NONE        gui=italic          ctermfg=darkgray    ctermbg=NONE        cterm=BOLD
hi String           guifg=#A8FF60     guibg=NONE        gui=NONE            ctermfg=green       ctermbg=NONE        cterm=NONE
hi Number           guifg=#FF73FD     guibg=NONE        gui=NONE            ctermfg=magenta     ctermbg=NONE        cterm=NONE

hi Keyword          guifg=#96CBFE     guibg=NONE        gui=NONE            ctermfg=blue        ctermbg=NONE        cterm=NONE
hi PreProc          guifg=#96CBFE     guibg=NONE        gui=NONE            ctermfg=blue        ctermbg=NONE        cterm=BOLD
hi Conditional      guifg=#6699CC     guibg=NONE        gui=NONE            ctermfg=blue        ctermbg=NONE        cterm=NONE

hi Todo             guifg=darkred     guibg=NONE        gui=BOLD,italic     ctermfg=darkred     ctermbg=NONE        cterm=NONE
hi Constant         guifg=#99CC99     guibg=NONE        gui=NONE            ctermfg=cyan        ctermbg=NONE        cterm=NONE

hi Identifier       guifg=#C6C5FE     guibg=NONE        gui=NONE            ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Function         guifg=#FFD2A7     guibg=NONE        gui=NONE            ctermfg=brown       ctermbg=NONE        cterm=NONE
hi Type             guifg=#FFFFB6     guibg=NONE        gui=NONE            ctermfg=yellow      ctermbg=NONE        cterm=BOLD
hi Statement        guifg=#6699CC     guibg=NONE        gui=NONE            ctermfg=magenta     ctermbg=NONE        cterm=BOLD

hi Special          guifg=#E18964     guibg=NONE        gui=NONE            ctermfg=white       ctermbg=NONE        cterm=NONE
hi Delimiter        guifg=#00A0A0     guibg=NONE        gui=NONE            ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Operator         guifg=#AFD787     guibg=NONE        gui=NONE            ctermfg=white       ctermbg=NONE        cterm=NONE

hi CursorLine       guifg=green       guibg=#202020     gui=BOLD            ctermfg=yellow      ctermbg=black       cterm=BOLD
hi CursorColumn     guifg=green       guibg=#202020     gui=NONE            ctermfg=yellow      ctermbg=black       cterm=BOLD
hi MatchParen       guifg=#FF0000     guibg=NONE        gui=BOLD            ctermfg=white       ctermbg=darkgray    cterm=NONE
hi Pmenu            guifg=#F6F3E8     guibg=#444444     gui=NONE            ctermfg=black       ctermbg=white       cterm=NONE
hi PmenuSel         guifg=#000000     guibg=#CAE682     gui=NONE            ctermfg=yellow      ctermbg=darkgray    cterm=BOLD
hi Search           guifg=#FFFF86     guibg=#2F2F00     gui=NONE            ctermfg=yellow      ctermbg=red         cterm=BOLD

hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special
hi link helpBar         String
hi link helpStar        String

" Extra
hi extraWhiteSpace  guifg=#FFFFFF     guibg=#0000FF     gui=NONE
hi extraTab         guifg=#000000     guibg=#00FF00     gui=NONE

" SignColumn
hi SignColumn       guifg=#000000     guibg=#444444     gui=NONE            ctermfg=14          ctermbg=242         cterm=BOLD     term=standout

" StatusLine
hi StatusLineWarn   guifg=#FFFF40     guibg=#202020     gui=NONE            ctermfg=yellow      ctermbg=black       cterm=BOLD
hi StatusLineError  guifg=#FF3333     guibg=#202020     gui=NONE            ctermfg=red         ctermbg=black       cterm=BOLD

" mxInfo - Syntax Highlighting
hi mxinfoHeader     guifg=#FFFFFF     guibg=NONE        gui=NONE            ctermfg=white       ctermbg=NONE        cterm=BOLD
hi mxinfoL1         guifg=#508ED8     guibg=NONE        gui=BOLD
hi mxinfoL2         guifg=#C0A25F     guibg=NONE        gui=NONE
hi mxinfoL2B        guifg=#C0A25F     guibg=NONE        gui=BOLD
hi mxinfoL3         guifg=#900000     guibg=NONE        gui=NONE
hi mxinfoL3B        guifg=#900000     guibg=NONE        gui=BOLD
hi mxinfoItemBN     guifg=#1818FF     guibg=NONE        gui=NONE
hi mxinfoItemBB     guifg=#1818FF     guibg=NONE        gui=BOLD
hi mxinfoItemRN     guifg=#FF0033     guibg=NONE        gui=NONE
hi mxinfoItemRB     guifg=#FF0033     guibg=NONE        gui=BOLD
hi mxinfoItemGN     guifg=#4C4C4C     guibg=NONE        gui=NONE
hi mxinfoItemGB     guifg=#4C4C4C     guibg=NONE        gui=BOLD
hi mxinfoBullet     guifg=#A8FF60     guibg=NONE        gui=BOLD
hi mxinfoEmphasis   guifg=#E00000     guibg=NONE        gui=NONE            ctermfg=darkred     ctermbg=NONE        cterm=NONE
hi mxinfoDQString   guifg=#E85848     guibg=NONE        gui=NONE
hi mxinfoCommand    guifg=#4C4C4C     guibg=NONE        gui=NONE

" PHP
hi phpRegion        guifg=white       guibg=NONE        gui=NONE

" Session Manager
hi SessionManHelp   guifg=#7C7C7C     guibg=NONE        gui=NONE            ctermfg=darkgray    ctermbg=NONE        cterm=BOLD
hi SessionManTitle  guifg=#C6C5FE     guibg=NONE        gui=BOLD            ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi SessionManFile   guifg=#C6C5FE     guibg=NONE        gui=NONE            ctermfg=cyan        ctermbg=NONE        cterm=BOLD
hi SessionManError  guifg=#FF0000     guibg=NONE        gui=BOLD            ctermfg=white       ctermbg=darkgray    cterm=NONE

" Tagbar
hi TagbarKind       guifg=#C6C5FE     guibg=NONE        gui=BOLD            ctermfg=cyan        ctermbg=NONE        cterm=NONE

" vDebug
hi DbgBreakptLine   guifg=#FFFFFF     guibg=#007000     gui=NONE            ctermfg=white       ctermbg=darkgreen   cterm=BOLD
hi DbgBreakptSign   guifg=#FFF800     guibg=#007000     gui=NONE            ctermfg=white       ctermbg=darkgreen   cterm=BOLD
hi DbgCurrentLine   guifg=#FFFF00     guibg=#0000FF     gui=NONE            ctermfg=yellow      ctermbg=darkblue    cterm=BOLD
hi DbgCurrentSign   guifg=#FFFF00     guibg=#0000FF     gui=NONE            ctermfg=yellow      ctermbg=darkblue    cterm=BOLD
