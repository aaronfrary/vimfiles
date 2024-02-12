" Author: Aaron Frary <af@aaronfrary.com>

let mapleader = "\<Space>"
let maplocalleader = ","

" Install single threaded for safety, can remove if too slow.
let g:plug_threads=1
call plug#begin()

  " Sensible defaults
  Plug 'aaronfrary/vimrc'

  " Language pack
  Plug 'sheerun/vim-polyglot'
  Plug 'andreshazard/vim-freemarker'

  " Intellisense engine + Language Server Protocol support
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Syntax highlighting for jsonc.
  Plug 'neoclide/jsonc.vim'

  " Make . command more consistent
  Plug 'tpope/vim-repeat'

  " Improve iTerm2 integration
  Plug 'sjl/vitality.vim'

  " Support for .editorconfig files (https://editorconfig.org)
  Plug 'editorconfig/editorconfig-vim'

  " Show index of matches when searching
  Plug 'vim-scripts/IndexedSearch'

  " Show git diff in left column
  Plug 'airblade/vim-gitgutter'

  " Sets cwd to project root automatically
  Plug 'airblade/vim-rooter'

  " Improvements to netrw directory browser
  Plug 'tpope/vim-vinegar'

  " :Rename {new_filename}
  Plug 'danro/rename.vim'

  " Run ack or ag search tools from Vim
  " :Ack [options] {pattern} [{directories}]
  Plug 'mileszs/ack.vim'
  if executable('ag')
    let g:ackprg='ag --vimgrep'
  endif
  cnoreabbrev Ack Ack!
  cnoreabbrev ack Ack!
  cnoreabbrev ag Ack!

  " Press v over and over again to expand selection
  Plug 'terryma/vim-expand-region'
  vmap v <Plug>(expand_region_expand)
  vmap V <Plug>(expand_region_shrink)

  " gc<motion> to toggle comments
  Plug 'tpope/vim-commentary'

  " ii / ai motions
  Plug 'michaeljsmith/vim-indent-object'

  " Colorscheme
  Plug 'aaronfrary/mombat.vim'

  " Fancy prompt
  Plug 'bling/vim-airline'
  let g:airline_theme='mombat'
  let g:airline_left_sep=''
  let g:airline_right_sep=''
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.crypt='🔒'
  let g:airline_symbols.linenr='¶'
  let g:airline_symbols.branch='⎇'
  let g:airline_symbols.paste='ρ'
  let g:airline_symbols.whitespace='Ξ'
call plug#end()

" Set filetypes for special files.
augroup special_files
  autocmd!
  au BufRead,BufNewFile tsconfig.json set filetype=jsonc
augroup END

" Fundamental map: Escape = jj (or jk)
inoremap jj <esc>`^
inoremap jk <esc>`^

" <Leader> cancels commands
onoremap <Leader> <Esc>
" <Leader><Leader> is jj for other modes
nnoremap <Leader><Space> <Esc>
vnoremap <Leader><Space> <Esc>

" Always show sign column
set signcolumn=yes

" Use \{\{\{ as fold markers and show folds on the left.
set foldmethod=marker
set fdc=1

"" Configure Coc

" Use <tab> and <S-tab> to navigate completion list.
" (Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin)

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Navigate diagnostics
nmap <silent> <Leader>k <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>j <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"" Miscellaneous shortcuts

" Clear search highlighting and re-draw the screen
nnoremap <silent> <Leader>l :nohl<CR><C-L>

" Easy clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Visually select the text that was last edited/pasted (Vimcast#26).
noremap gV `[v`]

" Faster navigation of splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Toggle Spell checking
nnoremap <Leader>s :setlocal invspell<CR>

" LaTeX Preview (using pdflatex and Skim on MacOS X)
" First command compiles; second opens the pdf.
augroup latex_preview
  autocmd!
  autocmd FileType tex nnoremap <Leader><CR>
        \ :w \| !cd %:h && pdflatex %:t<CR>
  autocmd FileType tex nnoremap <Leader>=
        \ :let x=system('open -a Skim ' . expand('%:r') . '.pdf &')<CR>
augroup END

colorscheme mombat
