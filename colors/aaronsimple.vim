
" Authors: Aaron Graham-Horowitz
" Description: A simple, low-contrast dark color scheme for vim and gvim.

" Boilerplate stuff
set background=dark
"highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "aaronsimple"

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

" -- Terminal colors --

" Default
hi Normal cterm=NONE ctermfg=252 ctermbg=233

" Cursor
hi Cursor cterm=NONE ctermfg=0 ctermbg=10

" Matched indices (test {test} [] test)
hi MatchParen cterm=NONE ctermfg=0 ctermbg=125

" Visual mode
hi Visual cterm=inverse ctermfg=NONE ctermbg=NONE

" Cursor line/column hilighting
hi CursorLine cterm=NONE ctermfg=NONE ctermbg=234
hi CursorColumn cterm=NONE ctermfg=NONE ctermbg=234

" Line numbering
hi LineNr cterm=NONE ctermfg=236 ctermbg=NONE

" Search Hilighting
hi Search cterm=NONE ctermfg=233 ctermbg=141

" Status bar / window splits
hi StatusLine cterm=NONE ctermfg=0 ctermbg=239
hi StatusLineNC cterm=NONE ctermfg=0 ctermbg=236
hi VertSplit cterm=NONE ctermfg=0 ctermbg=NONE

" Folds
hi Folded cterm=NONE ctermfg=33 ctermbg=236

" Special columns
hi FoldColumn cterm=NONE ctermfg=33 ctermbg=236
hi SignColumn cterm=NONE ctermfg=33 ctermbg=236

" Syntax Hilighting
hi Comment cterm=NONE ctermfg=248 ctermbg=NONE
hi Constant cterm=NONE ctermfg=187 ctermbg=NONE
hi String cterm=NONE ctermfg=181 ctermbg=NONE
hi Identifier cterm=NONE ctermfg=68 ctermbg=NONE
hi Statement cterm=NONE ctermfg=221 ctermbg=NONE
hi aaronAssignment cterm=NONE ctermfg=214 ctermbg=NONE
hi aaronEqualsAssignment cterm=NONE ctermfg=208 ctermbg=NONE
hi PreProc cterm=NONE ctermfg=68 ctermbg=NONE
hi Type cterm=NONE ctermfg=77 ctermbg=NONE
hi Special cterm=NONE ctermfg=167 ctermbg=NONE


" -- GUI colors --

" Default
hi Normal gui=NONE guifg=#e0e0e0 guibg=#17171d

" Cursor
hi Cursor gui=bold guifg=bg guibg=#de6c40

" Matched indices (test {test} [] test)
hi MatchParen guifg=bg guibg=#ccac40

" Visual mode
hi Visual gui=inverse guibg=bg

" Cursor line/column hilighting
hi CursorLine guifg=NONE guibg=#1d1d25
hi CursorColumn guifg=NONE guibg=#1d1d25

" Line numbering
hi LineNr gui=NONE guifg=#3c3c4a guibg=NONE

" Search Hilighting
hi Search guifg=bg guibg=fg
hi IncSearch guifg=bg guibg=#ccac40

" Folds
hi Folded gui=NONE guifg=#a4d8ff guibg=#556868

" Special columns
hi FoldColumn guifg=#e4c888 guibg=#556868
hi SignColumn guifg=#fc941c guibg=#556868

" Popup menus
hi Pmenu guifg=#000000 guibg=#b2fe40

" Syntax Hilighting
hi Comment gui=Italic guifg=#989898 guibg=NONE
hi Constant gui=NONE guifg=#d1c295 guibg=NONE
hi String gui=NONE guifg=#d9a7b4 guibg=NONE
hi Identifier gui=NONE guifg=#9080d8 guibg=NONE
hi Statement gui=NONE guifg=#debb40 guibg=NONE
hi aaronAssignment gui=NONE guifg=#f5901b guibg=NONE
hi aaronEqualsAssignment gui=Bold guifg=#f5901b guibg=NONE
hi PreProc gui=NONE guifg=#4063de guibg=NONE
hi Type gui=NONE guifg=#a5d195 guibg=NONE
hi Special gui=NONE guifg=#da5b2a guibg=NONE
hi texMath gui=NONE guifg=fg guibg=NONE
