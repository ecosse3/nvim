call plug#begin('~/.vim/plugged')

" General
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'luochen1990/rainbow'
Plug 'mbbill/undotree'
Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'mhinz/vim-startify'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'liuchengxu/vim-which-key'
Plug 'iamcco/markdown-preview.vim'
Plug 'turbio/bracey.vim'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-surround'

" Snippets & Language
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'potatoesmaster/i3-vim-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'liuchengxu/vista.vim'
Plug 'Yggdroot/indentLine'

" React Development
Plug 'ianks/vim-tsx'
Plug 'yuezk/vim-js'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mlaursen/vim-react-snippets'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'jparise/vim-graphql'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'rhysd/git-messenger.vim'
Plug 'rhysd/conflict-marker.vim'
" Plug 'f-person/git-blame.nvim'

" Themes - keep only currently used for performance
Plug 'bluz71/vim-nightfly-guicolors'
" Plug 'morhetz/gruvbox'
" Plug 'joshdick/onedark.vim'
" Plug 'dracula/vim', {'as': 'dracula'}
" Plug 'mhartington/oceanic-next'
" Plug 'skbolton/embark'
" Plug 'christianchiarulli/nvcode-color-schemes.vim'
" Plug 'bluz71/vim-moonfly-colors'
" Plug 'drewtempelmeyer/palenight.vim'

" Colorscheme
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" Tabline
Plug 'vim-airline/vim-airline'
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'romgrk/barbar.nvim'

" Fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'airblade/vim-rooter'
Plug 'antoinemadec/coc-fzf'

" Ranger
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" Firenvim
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()
