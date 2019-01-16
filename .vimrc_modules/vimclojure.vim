autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure
au Filetype clojure nmap rr :Require<cr>

