"
"  Script:    mx_black.vim - MyXelf LightLine Color Scheme
"
"  Author:    Juan J Gonzalez Cardenas [Jota Jota] - <https://github.com/MyXelf/mx-dot-files>
"  Version:   1.0.0.0
"  Date:      30.Dec.2017
"
"  Legal:     Copyright (c) 2017-2018. Licensed under the MIT license.
"

let s:p = { 'normal': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}, 'inactive': {} }

let s:p.normal.left    = [ ['#00005f', '#dfff00', 17, 190, 'bold'], ['#ffffff', '#585858', 231, 240] ]
let s:p.normal.middle  = [ ['#ffffff', '#202020', 231, 234] ]
let s:p.normal.right   = [ ['#ffffff', '#0000ff', 234, 251], ['#1c1c1c', '#c6c6c6', 234, 251], ['#d0d0d0', '#585858', 252, 240], ['#9e9e9e', '#303030', 247, 236] ]

let s:p.insert.left    = [ ['#ffffff', '#000080', 231, 0, 'bold'], ['#ffffff', '#585858', 231, 240] ]
let s:p.insert.middle  = s:p.normal.middle
let s:p.insert.right   = s:p.normal.right

let s:p.replace.left   = [ ['#ffffff', '#5f0000', 231, 52, 'bold'], ['#ffffff', '#585858', 231, 240] ]
let s:p.replace.middle = s:p.normal.middle
let s:p.replace.right  = s:p.normal.right

let s:p.visual.left    = [ ['#000000', '#ffaf00', 16, 214, 'bold'], ['#ffffff', '#585858', 231, 240] ]

let s:p.tabline.left   = [ ['#d0d0d0', '#202020', 252, 240] ]
let s:p.tabline.middle = [ ['#d0d0d0', '#202020', 252, 234] ]
let s:p.tabline.right  = [ ['#d0d0d0', '#202020', 252, 240] ]
let s:p.tabline.tabsel = [ ['#1c1c1c', '#c6c6c6', 234, 251] ]

let s:p.normal.error   = [ ['#bcbcbc', '#990000', 250, 160] ]
let s:p.normal.warning = [ ['#262626', '#df5f00', 235, 166] ]

let s:p.inactive.right = [ ['#262626', '#606060', 235, 241], ['#585858', '#262626', 240, 235], ['#585858', '#121212', 240, 233] ]
let s:p.inactive.left  = s:p.inactive.right[1:]

let g:lightline#colorscheme#mx_black#palette = s:p
