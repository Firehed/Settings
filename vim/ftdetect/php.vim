" Not sure why this file is necessary, but the omnicomplete stuff won't work
" without it. Seems to be some sort of collision with hacklang
au BufNewFile,BufRead *.php set ft=php

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
