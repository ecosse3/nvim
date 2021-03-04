call plug#begin('~/.vim/plugged')

" General
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.vim'
Plug 'luochen1990/rainbow'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mbbill/undotree'
Plug 'b3nj5m1n/kommentary'
Plug 'suy/vim-context-commentstring'
Plug 'easymotion/vim-easymotion'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'dhruvasagar/vim-table-mode'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'liuchengxu/vim-which-key'
Plug 'antoinemadec/openrgb.nvim', {'do': 'UpdateRemotePlugins'}
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

" Snippets & Language
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'potatoesmaster/i3-vim-syntax'
Plug 'Yggdroot/indentLine'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" React Development
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
Plug 'yuezk/vim-js'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'peitalin/vim-jsx-typescript'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'mlaursen/vim-react-snippets'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'ianks/vim-tsx'
Plug 'neoclide/vim-jsx-improve'

" Git
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'f-person/git-blame.nvim', { 'branch': 'master' }

" Themes
Plug 'bluz71/vim-nightfly-guicolors'

" Colorscheme
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'powerline/powerline'
Plug 'ryanoasis/vim-devicons'

" Tabline
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Fzf
Plug 'antoinemadec/coc-fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'stsewd/fzf-checkout.vim' " Not using it since lazygit
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Ranger
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

call plug#end()
