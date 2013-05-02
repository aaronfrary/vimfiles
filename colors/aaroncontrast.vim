
" Authors: Aaron Graham-Horowitz
" Description: A higher contrast dark color scheme for the gui.

" Boilerplate stuff
set background=dark
highlight clear
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
hi Normal cterm=NONE ctermfg=NONE ctermbg=233 gui=NONE guifg=#e8e8e8 guibg=#1a1a20

" Cursor
hi Cursor gui=bold guifg=bg guibg=#de6c40

" Matched indices
hi MatchParen gui=NONE guifg=bg guibg=#ccac40

" Visual mode
hi Visual cterm=inverse ctermbg=bg gui=inverse guibg=bg

" Cursor line/column hilighting
hi CursorLine cterm=NONE ctermfg=NONE ctermbg=234 gui=NONE guifg=NONE guibg=#202028
hi CursorColumn cterm=NONE ctermfg=NONE ctermbg=234 gui=NONE guifg=NONE guibg=#202028

" Line numbering
hi LineNr cterm=NONE ctermfg=236 ctermbg=NONE gui=NONE guifg=#3c3c4a guibg=NONE

" Search Hilighting
hi IncSearch cterm=NONE ctermfg=Black ctermbg=DarkYellow guifg=Black guibg=DarkYellow
hi Search cterm=NONE ctermfg=Black ctermbg=LightGrey guifg=Black guibg=LightGrey

" Folds
hi Folded cterm=NONE ctermfg=11 ctermbg=236 gui=NONE guifg=#a4d8ff guibg=#556868

" Special columns
hi FoldColumn cterm=NONE ctermfg=11 ctermbg=236 gui=NONE guifg=#e4c888 guibg=#556868
hi SignColumn cterm=NONE ctermfg=11 ctermbg=236 gui=NONE guifg=#fc941c guibg=#556868

" Popup menus
hi Pmenu cterm=NONE ctermfg=11 ctermbg=236 gui=NONE guifg=#000000 guibg=#b2fe40

" Syntax Hilighting
hi Comment cterm=NONE ctermfg=60 ctermbg=NONE gui=Italic guifg=#939bed guibg=NONE
hi Constant cterm=NONE ctermfg=208 ctermbg=NONE gui=NONE guifg=#bb40de guibg=NONE
hi String cterm=NONE ctermfg=209 ctermbg=NONE gui=NONE guifg=#ed93c8 guibg=NONE
hi Character cterm=NONE ctermfg=LightRed ctermbg=NONE gui=NONE guifg=#ed93c8 guibg=NONE
hi Identifier cterm=NONE ctermfg=196 ctermbg=NONE gui=NONE guifg=#4ce2cc guibg=NONE
hi Statement cterm=Bold ctermfg=125 ctermbg=NONE gui=NONE guifg=#f5901b guibg=NONE
hi aaronAssignment cterm=NONE ctermfg=125 ctermbg=NONE gui=NONE guifg=#ecd440 guibg=NONE
hi aaronEqualsAssignment cterm=Bold ctermfg=125 ctermbg=NONE gui=bold guifg=#f4dc40 guibg=NONE
hi PreProc cterm=NONE ctermfg=34 ctermbg=NONE gui=NONE guifg=#4063de guibg=NONE
hi Type cterm=NONE ctermfg=179 ctermbg=NONE gui=NONE guifg=#b2de40 guibg=NONE
hi Special cterm=NONE ctermfg=196 ctermbg=NONE gui=NONE guifg=#e82a2a guibg=NONE
hi texMath cterm=NONE ctermfg=196 ctermbg=NONE gui=NONE guifg=fg guibg=NONE

