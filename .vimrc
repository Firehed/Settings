"Pathogen plugin
execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme default
set background=light
set laststatus=2 " Allows Lightline to work properly
let g:lightline = {
            \ 'colorscheme': 'solarized_dark',
            \ 'inactive': {
            \   'left': [['readonly', 'relativepath', 'modified']]
            \ },
            \ 'component': {
            \   'readonly': '%{&readonly?"RO":""}',
            \ },
            \ }

" Tab highlight plugin
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors=0
hi IndentGuidesOdd ctermbg=233
hi IndentGuidesEven ctermbg=234

" Local .vimrc: save settings when uppercase
let g:localvimrc_persistent = 1

" Set leader to space. Why not?
let mapleader = "\<space>"

" Bounce around with leader-arrow
nnoremap <leader><up> <C-w>k
nnoremap <leader><down> <C-w>j
nnoremap <leader><left> <C-w>h
nnoremap <leader><right> <C-w>l
set splitbelow
set splitright

set backspace=2 " Make backspace behave like a traditional editor, no special handling of indenting or line breaks
set nocompatible
set encoding=utf-8
set expandtab " Expand (or not) tabs into spaces
set softtabstop=4
set shiftwidth=4
set tabstop=4 " Width of a tab literal, in spaces
set scrolloff=3 " Scroll window when cursor is near, not at, the top/bottom
set showmatch " Highlight matching brackets

" Search settings
set hlsearch " Highlight search matches
set incsearch " Show pattern matching in realtime
set ignorecase " Default to case-insensitive search
set smartcase " Smart case-sensitivity (become case-sensitive if search contains uppercase chars)
" <leader><space> to remove search highlights
noremap <leader><space> :noh<cr>

set ruler
set vb t_vb=
set number
set list
set listchars=tab:▸\ ,eol:¬
set noswapfile

" Move by screen line not file line
nnoremap j gj
nnoremap k gk

" Disable F1 help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

set wrap
set textwidth=79
set colorcolumn=80
set formatoptions=qrn1

" experimenting with search options
"nnoremap / /\v
"vnoremap / /\v


" Tips+plugins from http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" <leader>W strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Autocomplete settings
set completeopt=longest,menuone

" Rust autocomplete with Racer
let g:racer_cmd = $HOME.'/.cargo/bin/racer'

" Allow SuperTab to hijack the autocomplete keystrokes
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
set tags=tags;
