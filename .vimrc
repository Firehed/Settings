" turn on syntax highlighting

"Pathogen plugin
execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme default

" Tab highlight plugin
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors=0
hi IndentGuidesOdd ctermbg=233
hi IndentGuidesEven ctermbg=234

" Local .vimrc: save settings when uppercase
let g:localvimrc_persistent = 1

set nocompatible
set encoding=utf-8
set noexpandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4

" Search settings
set showmatch
set hls is ic scs " highlight search, incremental search, ignore case, smart case
noremap <leader><space> :noh<cr>
" leader+space to clear search highlight

set ruler
set vb t_vb=
set number
set list
set listchars=tab:▸\ ,eol:¬

" Move by screen line not file line
nnoremap j gj
nnoremap k gk

" Disable F1 help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

set wrap
set textwidth=79
set formatoptions=qrn1

" experimenting with search options
"nnoremap / /\v
"vnoremap / /\v


" Tips+plugins from http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" <leader>W strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>


