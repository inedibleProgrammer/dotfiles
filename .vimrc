set termguicolors
set cscopeverbose
set cscopetag
set tabstop=4
set shiftwidth=4
set number
set relativenumber
set laststatus=2
"set softtabstop
set expandtab
"set softtabstop
set autoindent
set smartindent
set cindent
set backspace=indent,eol,start
set nobackup
set noundofile
set scrolloff=10
set path+=** " search down into subfolders (for tab-complete)
set wildmenu " display all matching files for tab-complete
set wrap!
set autochdir
"set tags=tags;
set tags=./tags;
set guifont=Consolas:h11
set ruler
filetype on
filetype plugin indent on

set encoding=utf-8
:set listchars=tab:>-,trail:∙,extends:>,precedes:<,space:∙
:set list


" highlighting and color
"""""""""""""""""""""""""""""""""""
syntax on
colorscheme gruvbox

" fuzzy find using CTRL-p
nnoremap <C-p> :find ./**/*