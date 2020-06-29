" setlocal omnifunc=phpcomplete#CompletePHP

map <Leader>l :!php -l %<CR>
map <Leader>u :!arc unit<CR>

autocmd FileType php setlocal commentstring=//\ %s
" let g:ale_php_phpcs_standard="PSR2"
