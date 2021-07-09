call plug#begin('~/.vim/plugged')

" General
Plug 'iamcco/markdown-preview.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mbbill/undotree'
Plug 'b3nj5m1n/kommentary'
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
Plug 'szw/vim-maximizer'
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/vim-easy-align'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'nacro90/numb.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'ggandor/lightspeed.nvim'

" Debug
" Plug 'mfussenegger/nvim-dap'
" Plug 'rcarriga/nvim-dap-ui'

" Snippets & Language & Syntax
Plug 'windwp/nvim-autopairs'
Plug 'p00f/nvim-ts-rainbow'
Plug 'mattn/emmet-vim'
Plug 'potatoesmaster/i3-vim-syntax'
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'master' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'hrsh7th/vim-vsnip'
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
Plug 'jose-elias-alvarez/null-ls.nvim'

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
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

" Tabline
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Project Tracker
Plug 'airblade/vim-rooter'
" Plug 'ahmedkhalf/lsp-rooter.nvim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': 'master' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-fzy-native.nvim', { 'do': 'make' }

" Ranger
Plug 'kevinhwang91/rnvimr'

call plug#end()
