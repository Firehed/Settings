" Override Vim built-in phpcomplete to use ALE/LSP
setlocal omnifunc=ale#completion#OmniFunc

" Use // for comments (Vim 9.1 changed default to /* */)
setlocal commentstring=//\ %s
