
"-----------------------------------------------------------
" A few simple utilities I've put together

"Tab autocompletes where relevent, tabs otherwise
function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-X>\<C-O>"
  endif
endfunction
inoremap <silent> <Tab> <C-R>=CleverTab()<CR>

" Awesome math w/ Python - <Leader>m to print, <Leader>M to change.
if has('python')
  py import vim
  py from math import *
  " Operate on a math-only line
  nnoremap <Leader>m :.py print eval(vim.current.range[0])<CR>
  nnoremap <silent> <Leader>M :.py vim.current.range[0] = str(eval(vim.current.range[0]))<CR>
  " Operate on selected region. May have trouble if 'selection' is set to 'inclusive'.
  vnoremap <Leader>m "ay:py print <C-r>a<CR>gv
  vnoremap <silent> <Leader>M "ay:.py r = vim.current.range; _,p = vim.current.window.cursor; r[0] = r[0][:p] + str(<C-r>a) + r[0][p:]<CR>:s/<C-r>a//I<CR>
endif

" Use ds to delete matching indices (dr if on right paren)
nnoremap ds %x``x
nnoremap dr %%x``x

" Use cs to change matching indices
nnoremap cs( %r)``r(
nnoremap cs) %%r)``r(
nnoremap cs[ %r]``r[
nnoremap cs] %%r]``r[
nnoremap cs{ %r}``r{
nnoremap cs} %%r}``r{ 
nnoremap cs< %r>``r<
nnoremap cs> %%r>``r<
nnoremap cs" %%r"``r"
nnoremap cs' %%r'``r'
nnoremap cs<Space> %%r<Space>``r<Space>

" Improved 'make' and run commands
augroup quickmake
  autocmd!
  autocmd Filetype c nnoremap <F5> :make %:r<Bar>!./%:r<CR>
  autocmd Filetype c nnoremap <F6> :make %:r<CR>
  autocmd Filetype python nnoremap <F5> :!python %<CR>
  autocmd Filetype ocaml nnoremap <F5> :!ocaml %<CR>
  autocmd Filetype coffee nnoremap <F5> :CoffeeMake<CR>
  autocmd Filetype coffee nnoremap <F6> :CoffeeCompile<CR>
augroup end

