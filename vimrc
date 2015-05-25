
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Check environment
if !empty(glob(expand("~/vimfiles/")))
  let s:vimdir=expand("~/vimfiles/")
  let s:bundledir=expand("~/vimfiles/bundle/")
else
  let s:vimdir=expand("~/.vim/")
  let s:bundledir=expand("~/.vim/bundle/")
endif

"let s:bundledir = s:vimdir . 'bundle/'

if !empty(glob(s:vimdir . "bundle/Vundle.vim/README.md"))
  " {{{ Vundle for plugins
  " {{{ setup part 1
  filetype off
  " set the runtime path to include Vundle and initialize
  execute 'set rtp+=' . s:bundledir . 'Vundle.vim'
  call vundle#begin(s:bundledir)
  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'

  " The following are examples of different formats supported.
  " Keep Plugin commands between vundle#begin/end.
  " plugin on GitHub repo
  "Plugin 'tpope/vim-fugitive'
  " plugin from http://vim-scripts.org/vim/scripts.html
  "Plugin 'L9'
  " Git plugin not hosted on GitHub
  "Plugin 'git://git.wincent.com/command-t.git'
  " git repos on your local machine (i.e. when working on your own plugin)
  "Plugin 'file:///home/gmarik/path/to/plugin'
  " The sparkup vim script is in a subdirectory of this repo called vim.
  " Pass the path to set the runtimepath properly.
  "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  " Avoid a name conflict with L9
  "Plugin 'user/L9', {'name': 'newL9'}
  " }}}
  Plugin 'jpalardy/vim-slime'
  Plugin 'christoomey/vim-tmux-navigator'
  Plugin 'vim-scripts/paredit.vim'
  Plugin 'kien/rainbow_parentheses.vim'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'scrooloose/syntastic'
  " {{{ setup part 2
  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  " To ignore plugin indent changes, instead use:
  "filetype plugin on
  "
  " Brief help
  " :PluginList       - lists configured plugins
  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
  "
  " see :h vundle for more details or wiki for FAQ
  " Put your non-Plugin stuff after this line
  " }}}
  " }}}
endif
filetype plugin indent on

" Fundamental map: Escape = jj (some prefer jk)
inoremap jj <esc>`^
inoremap jk <esc>`^

" Important! Preface user-defined commands with <Space> = <Leader>
let mapleader = " "

" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: Aaron Graham-Horowitz
" Description: A full-featured vimrc built to my tastes, but with care taken
" not to change too many of the default mappings so that a user can still
" comfortably use vim without these settings after becoming adjusted.
"
" I keep this in my vimfiles or .vim directory and source it to my actual
" .vimrc, as this makes it easier to maintain with git.  Do whatever works
" best for you.
"
" Based on the basic vimrc template provided by the folks at
" http://vim.wikia.com/wiki/Vim_on_Freenode, which can be found at
" http://vim.wikia.com/wiki/Example_vimrc.

" {{{ Must have features
"
" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Enable syntax highlighting
syntax on
"
" Enable omni-complete
set omnifunc=syntaxcomplete#Complete

" Auto-close omni-helper window on leaving insert mode
augroup preview
  autocmd!
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif
augroup end

" Make buffers and tabs play nice
set switchbuf=usetab,split

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> (redraw) or <Leader>l to clear)
set hlsearch
nnoremap <C-L> :nohl<CR><C-L>
nnoremap <silent> <Leader>l :nohl<CR>

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
set nomodeline

" }}}
"------------------------------------------------------------
" {{{ Usability options
"
" Extended % matching
runtime macros/matchit.vim

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
set nostartofline

" Don't allow selection past the end of the line. This prevents accidentally
" yanking an unwanted newline.
"set selection=old
" NEVERMIND, not compatible with paredit mode
set selection=inclusive

" Show window title in xterm
set title

" Emulate standard status line with 'ruler' set
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Abbreviate messages
set shortmess=atI

" Maintain a little context around cursor at top or bottom of screen
set scrolloff=1

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" No blinking cursor
set guicursor=a:blinkon0

" Disable use of the mouse for all modes
set mouse=

" Reasonable default size for terminal
" (removed because of problems with tmux panes)
"set columns=90
"set lines=44

" Keeps lines under 80 characters -- Good programming practice
set textwidth=79

" Set the command window height to 2 lines, to avoid many cases of having to
" 'press <Enter> to continue'
" (turning this off for now, I need more screen real estate)
set cmdheight=2

" Display line numbers on the left (toggle with <Leader>n)
set numberwidth=2
nnoremap <silent> <Leader>n :set invnumber<CR>

" Hilight cursor line (toggle horiz/vert with <Leader>c)
set cursorline
nnoremap <silent> <Leader>c :set invcursorline<CR>
nnoremap <silent> <Leader>C :set invcursorcolumn<CR>

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Keep a longer history
set history=500

" Store temporary files centrally
set backupdir=~/.vim_tmp,~/.tmp.,~/tmp,/var/tmp,/tmp,~/vimfiles/tmp
set directory=~/.vim_tmp,~/.tmp.,~/tmp,/var/tmp,/tmp,~/vimfiles/tmp

" }}}
"------------------------------------------------------------
" {{{ Indentation options
"
" Indentation settings for using 2 spaces instead of tabs.
set tabstop=8
set shiftwidth=2
set softtabstop=2
" Spaces all the way!
set expandtab

" Python recommends 4-space indentation.
augroup indentation
  autocmd!
  autocmd FileType python set shiftwidth=4 | set softtabstop=4
augroup end


" }}}
"------------------------------------------------------------
" {{{ Folding options
"
" Show folds on left
set fdc=1

" Use \{\{\{ as fold markers.  This is a good default.
set foldmethod=marker
augroup folding
  autocmd!
" Any languages I use that require braces go here.
  autocmd Filetype c,php,java,js set foldmethod=syntax
augroup end

" }}}
"------------------------------------------------------------
" {{{ Useful mappings
"
" Map Y to act like D and C, i.e. to yank until EOL, rather than as yy.
nnoremap Y y$

" Center screen on IncSearch
map N Nzz
map n nzz

" Better jump behavior: now ' goes to the exact mark location and
" ` goes to the mark line
nnoremap ' `
nnoremap ` '
vnoremap ' `
vnoremap ` '

" <Leader><Leader> is jj for other modes
nnoremap <Leader><Space> <Esc>
vnoremap <Leader><Space> <Esc>
" <Leader> cancels commands
onoremap <Leader> <Esc>

" Faster navigation of splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Toggle Spell checking
nnoremap <Leader>s :setlocal invspell<CR>

" Toggle Rainbow Parentheses
nnoremap <Leader>r :RainbowParenthesesToggle<CR>

" Very no-magic for more intuitive search
nnoremap / /\V
nnoremap ? ?\V

" Make gf open the file in a new tab
map gf :tabe <cfile><CR>

" Paste and select text
nnoremap <Leader>p p`[v`]
nnoremap <Leader>P P`[v`]

" Faster viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" }}}
"------------------------------------------------------------
" {{{ Miscellaneous Conditionals
"
" I set very little here, so not worth a separate gvimrc.
augroup myGUI
  autocmd!
  autocmd GUIEnter * set visualbell t_vb=
augroup end
if has('gui_running')
  " Hide menu bar
  set guioptions-=m
  set lines=999 | set columns=112
  if has('gui_win32')
    set guifont=Consolas:h10:cANSI
  else
    set guifont=Monospace\ 12
  endif
endif

" Special settings for coquille
augroup coq
  autocmd!
  autocmd BufNewFile Goals setfiletype coquille
  autocmd BufNewFile Infos setfiletype coquille
  autocmd Filetype coq call coquille#FNMapping()
  autocmd Filetype coq hi checkedByCoq guibg=#282830
  autocmd Filetype coq hi sentToCoq guibg=#282850
  autocmd Filetype coq let g:coquille_auto_move = 'true'
  autocmd Filetype coq nnoremap K ?\v(Fixpoint\|Inductive\|Definition\|Scheme\|Ltac\|Example\|Lemma\|Theorem) <C-R><C-W><CR>zz
augroup end

" }}}
"------------------------------------------------------------
" {{{ Source a few files
"
" Colors
colorscheme aaronsimple
nnoremap <silent> <Leader>B :colorscheme aaroncontrast<CR>
nnoremap <silent> <Leader>b :colorscheme aaronsimple<CR>

" Some handy tricks
runtime aaronmacros.vim

" Plugins that don't work with Pathogen
autocmd Filetype tex runtime auctex.vim

" Source specific .vim files in working directory (must end in 'cfg.vim')
for fname in split(glob("*cfg.vim"), "\n") + split(glob(".*cfg.vim"))
  execute "source " . fnameescape(fname)
endfor

" }}}
"------------------------------------------------------------
" {{{ Settings for plugins
let g:paredit_leader = ","
let g:slime_target="tmux"
let g:slime_default_config={"socket_name": "default", "target_pane": "1"}

" Settings related to Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" }}}

