syntax on
filetype plugin indent on

call plug#begin('~/.config/nvim/plugged')

" Editor enhancements
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Git
Plug 'tpope/vim-fugitive'
" advance surround options
Plug 'tpope/vim-surround'
" moving with cammel case in mind
Plug 'bkad/CamelCaseMotion'
" lusty juggler jumping between files
Plug 'sjbach/lusty'
Plug 'godlygeek/tabular'
" search files
Plug 'kien/ctrlp.vim'
" indented vim paste
Plug 'sickill/vim-pasta'
" Close code sections
Plug 'tpope/vim-endwise'
" Comment shortcuts
Plug 'tomtom/tcomment_vim'
" Nice information line
Plug 'bling/vim-airline'

" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'vim-scripts/paredit.vim'
" refactoring
" Plug 'snoe/clj-refactor.nvim'



" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-completion-manager'
Plug 'clojure-vim/async-clj-omni'

" Blogging
Plug 'plasticboy/vim-markdown'

" Code checks
Plug 'scrooloose/syntastic'

call plug#end()

for module in ['camel_case','coloring','gvim','folding','key-bindings','backup','auto','syntastic','vimclojure','html_indent','spacing']
  exec 'so' '~/.vim/.vimrc_modules/'.module.'.vim'
endfor

let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

set tabstop=6
set smarttab
set laststatus=2

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set copyindent    " copy the previous indentation on " autoindenting
set shiftwidth=2  " number of spaces to use for " autoindenting
set shiftround    " use multiple of shiftwidth when " indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, "    case-sensitive otherwise
set hlsearch      " highlight search terms

let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1

" Search Options
set incsearch
set wildignore=*.swp,*.bak,*.pyc,*.class,target/*
let g:slimv_swank_clojure = '! xterm -e lein swank &'"

" lusty jugler requires this
set hidden
set statusline=%f%h%m%r%=\ %l,%c%V

let g:Powerline_symbols = 'fancy'

let g:session_autoload = 'no'

inoremap <silent> <buffer> <C-M-CR> <ESC>:call Toggle_task_status()<CR>i
noremap <silent> <buffer> <C-M-CR> :call Toggle_task_status()<CR>