call plug#begin('~/.vim/plugged')

" General
Plug 'turbio/bracey.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/markdown-preview.vim'
Plug 'luochen1990/rainbow'
Plug 'AndrewRadev/switch.vim'
Plug 'mbbill/undotree'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'dhruvasagar/vim-table-mode'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'liuchengxu/vim-which-key'

" Snippets & Language
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'potatoesmaster/i3-vim-syntax'
Plug 'Yggdroot/indentLine'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'liuchengxu/vista.vim'

" React Development
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'mlaursen/vim-react-snippets'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'ianks/vim-tsx'

" Git
Plug 'f-person/git-blame.nvim'
Plug 'mhinz/vim-signify'
Plug 'rhysd/conflict-marker.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'

" Themes - keep only currently used for performance
Plug 'bluz71/vim-nightfly-guicolors'
" Plug 'skbolton/embark'
" Plug 'morhetz/gruvbox'
" Plug 'christianchiarulli/nvcode-color-schemes.vim'
" Plug 'mhartington/oceanic-next'
" Plug 'joshdick/onedark.vim'
" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'dracula/vim', {'as': 'dracula'}
" Plug 'bluz71/vim-moonfly-colors'

" Colorscheme
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" Tabline
Plug 'vim-airline/vim-airline'
" Plug 'romgrk/barbar.nvim'
" Plug 'kyazdani42/nvim-web-devicons'

" Fzf
Plug 'antoinemadec/coc-fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'stsewd/fzf-checkout.vim'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Ranger
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

" Firenvim
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()
