" This file contains file detection and other automated actions

" clojure indent, this requires https://github.com/snoe/node-cljfmt
function! Indentclj()
  " saving current cursor location
  let regel=line(".")
  %!cljfmt-node
  " removing the empty line added by cljfmt-node
  %!head -q --lines=-1
  " jumping back to old location
  call cursor(regel, 1)
endfunction

augroup ClojureFormating
  autocmd!
  " we want to indent only source files, project.clj is ignored on purpose
  autocmd BufWritePre */src/*.clj silent! call Indentclj()
  autocmd BufWritePre */src/*.cljs silent! call Indentclj()
  autocmd BufWritePre */test/*.clj silent! call Indentclj()
  autocmd BufWritePre */test/*.cljs silent! call Indentclj()
augroup END

" reload vimrc post :w
autocmd! BufWritePost init.vim source %

" ruby
autocmd BufRead,BufNewFile *.ruby setlocal filetype=ruby
autocmd BufRead,BufNewFile *.erb setlocal filetype=eruby



