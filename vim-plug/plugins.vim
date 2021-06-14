call plug#begin('~/.vim/plugged')

" General
Plug 'iamcco/markdown-preview.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mbbill/undotree'
Plug 'b3nj5m1n/kommentary'
Plug 'phaazon/hop.nvim'
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
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/vim-easy-align'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'nacro90/numb.nvim'
Plug 'yamatsum/nvim-cursorline'
Plug 'folke/todo-comments.nvim'

" Snippets & Language & Syntax
Plug 'windwp/nvim-autopairs'
Plug 'p00f/nvim-ts-rainbow'
Plug 'mattn/emmet-vim'
Plug 'potatoesmaster/i3-vim-syntax'
Plug 'Yggdroot/indentLine'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
Plug 'kitagry/vs-snippets'

" Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
Plug 'glepnir/lspsaga.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
Plug 'folke/lsp-trouble.nvim'
Plug 'ray-x/lsp_signature.nvim'

" Explorer
Plug 'kyazdani42/nvim-tree.lua'

" React Development
Plug 'leafgarland/typescript-vim'
Plug 'yuezk/vim-js'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'peitalin/vim-jsx-typescript'
Plug 'mlaursen/vim-react-snippets'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/vim-jsx-improve'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

" Git
Plug 'rhysd/git-messenger.vim'
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

" Project Tracker
Plug 'airblade/vim-rooter'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'on': 'make' }

" Ranger
Plug 'kevinhwang91/rnvimr'

call plug#end()
