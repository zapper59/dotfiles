"
" Trim whitespace on file save.
"
augroup trimmer
    autocmd!
    autocmd FileType c,cpp,php,python,javascript,rpcgen,rst,sh autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup END
