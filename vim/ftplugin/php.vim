let b:ale_fixers = ['phpcbf']

" Disabling php: cspell, intelepense, langserver, phan, phpactor, phpmd, psalm, tlint
" let b:ale_linters = ['php', 'phpcs', 'phpstan']
let b:ale_linters_ignore = ['langserver', 'phpcs']

let g:ale_php_phpstan_executable="vendor/bin/phpstan"
let g:ale_php_langserver_executable="vendor/bin/psalm-language-server"