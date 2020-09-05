call plug#begin('~/.vim/plugged')

" General
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'luochen1990/rainbow'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-startify'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'liuchengxu/vim-which-key'

" Snippets & Language
Plug 'honza/vim-snippets'
Plug 'ianks/vim-tsx'
Plug 'yuezk/vim-js'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'mlaursen/vim-react-snippets'
Plug 'potatoesmaster/i3-vim-syntax'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'sheerun/vim-polyglot'
Plug 'jparise/vim-graphql'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'rhysd/git-messenger.vim'

" Tags
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'

" Themes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'mhartington/oceanic-next'
Plug 'skbolton/embark'

" Colorscheme
Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" Fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'airblade/vim-rooter'
"{{{
    let $FZF_DEFAULT_COMMAND="fd --hidden --type f --exclude .git"
    let $FZF_DEFAULT_OPTS="--reverse || --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null'"
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
    let g:fzf_nvim_statusline = 0
    let g:fzf_branch_actions = {
      \ 'track': {
      \   'prompt': 'Track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-t',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}
    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'Conditional', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'Conditional', 'Conditional'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
"}}}

call plug#end()
