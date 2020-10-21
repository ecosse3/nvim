" -------------------- General Settings ---------------------

syntax on                           " Enables syntax highlighting
filetype plugin indent on           " Enables plugin & indent

set hidden                          " Required to keep multiple buffers open multiple buffers
set encoding=utf-8                  " The encoding displayed
set fileencoding=utf-8              " The encoding written to file
set cmdheight=2                     " Give more space for displaying messages
set splitright                      " Vertical splits will automatically be to the right
set updatetime=300                  " Faster completion
set timeoutlen=500                  " Faster completion
set clipboard=unnamedplus           " Copy-paste between vim and everything else
set mouse=a                         " Enable mouse
set tabstop=2 softtabstop=2         " Insert 2 spaces for a tab
set shiftwidth=2                    " Change a number of space characeters inseted for indentation
set expandtab                       " Converts tab to spaces
set smartindent                     " Makes indenting smart
set smartcase                       " Uses case in search
set smarttab                        " Makes tabbing smarter will realize you have 2 vs 4
set showtabline=2                   " Always show tabs
set noshowmode                      " Don't show things like -- INSERT -- anymore
set autoindent                      " Good auto indent
set nu                              " Shows current line number
set relativenumber                  " Enables relative number
set noerrorbells                    " Disables sound effect for errors
set nowrap                          " Display long lines as just one line
set nobackup                        " Recommended by coc
set noswapfile                      " Recommended by coc
set noemoji                         " Fix emoji display
set undodir=~/.vim/undodir          " Dir for undos
set undofile                        " Sets undo to file
set incsearch                       " Start searching before pressing enter
set cursorline                      " Highlight of current line
set formatoptions-=c                " Stop newline continuation of comments
set formatoptions-=r
set formatoptions-=o
set t_Co=256                        " Support 256 colors
set backspace=indent,eol,start      " Making sure backspace works
"set autowriteall                   " Auto-saves buffers
set wildignore+=*node_modules/**    " Don't search inside Node.js modules (works for gutentag)

" Check if terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE ctermfg=15 ctermbg=7 guibg=NONE guifg=NONE gui=NONE
endif
