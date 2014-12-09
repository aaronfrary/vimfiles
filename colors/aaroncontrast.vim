
" Authors: Aaron Graham-Horowitz
" Description: A higher contrast dark color scheme for the gui.

" Boilerplate stuff
set background=dark
"highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "aaroncontrast"

" Distinguish assignment from other operations, to prevent things like
" if (x = y)
" Works for most languages but BE CAREFUL
highlight link aaronAssignment Operator
highlight link aaronEqualsAssignment Operator
highlight link aaronCompare Operator
augroup aaronsyntax
  autocmd!
  autocmd BufNewFile,BufRead * syn match aaronEqualsAssignment "\v\="
  autocmd BufNewFile,BufRead * syn match aaronEqualsAssignment "\v\-\="
  autocmd BufNewFile,BufRead * syn match aaronEqualsAssignment "\v\+\="
  autocmd BufNewFile,BufRead * syn match aaronAssignment "\v\-\-"
  autocmd BufNewFile,BufRead * syn match aaronAssignment "\v\+\+"
  autocmd BufNewFile,BufRead * syn match aaronCompare "\v\=\="
  autocmd BufNewFile,BufRead * syn match aaronCompare "\v\!\="
  autocmd BufNewFile,BufRead * syn match aaronCompare "\v\>\="
  autocmd BufNewFile,BufRead * syn match aaronCompare "\v\<\="
augroup end

" Default
hi Normal gui=NONE guifg=#e8e8e8 guibg=#1a1a20

" Cursor
hi Cursor gui=bold guifg=bg guibg=#de6c40

" Matched indices
hi MatchParen guifg=bg guibg=#ccac40

" Visual mode
hi Visual gui=inverse guibg=bg

" Cursor line/column hilighting
hi CursorLine guifg=NONE guibg=#202028
hi CursorColumn guifg=NONE guibg=#202028

" Line numbering
hi LineNr gui=NONE guifg=#3c3c4a guibg=NONE

" Search Hilighting
hi IncSearch guifg=Black guibg=DarkYellow
hi Search guifg=Black guibg=LightGrey

" Folds
hi Folded gui=NONE guifg=#a4d8ff guibg=#556868

" Special columns
hi FoldColumn guifg=#e4c888 guibg=#556868
hi SignColumn guifg=#fc941c guibg=#556868

" Popup menus
hi Pmenu guifg=#000000 guibg=#b2fe40

" Syntax Hilighting
hi Comment gui=Italic guifg=#939bed guibg=NONE
hi Constant gui=NONE guifg=#70a2fe guibg=NONE
hi String gui=NONE guifg=#ed93c8 guibg=NONE
hi Character gui=NONE guifg=#ed93c8 guibg=NONE
hi Identifier gui=NONE guifg=#4ce2cc guibg=NONE
hi Statement gui=NONE guifg=#f5901b guibg=NONE
hi aaronAssignment gui=NONE guifg=#ecd440 guibg=NONE
hi aaronEqualsAssignment gui=bold guifg=#f4dc40 guibg=NONE
hi PreProc gui=NONE guifg=#de4063 guibg=NONE
hi Type gui=NONE guifg=#b2de40 guibg=NONE
hi Special gui=NONE guifg=#e82a2a guibg=NONE
hi texMath gui=NONE guifg=fg guibg=NONE

