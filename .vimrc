" turn on syntax highlighting
:syntax on

"Pathogen plugin
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

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


