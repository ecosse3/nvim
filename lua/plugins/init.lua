local execute = vim.api.nvim_command

-- check if packer is installed (~/.local/share/nvim/site/pack)
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compile_path = install_path .. "/plugin/packer_compiled.lua"
local is_installed = vim.fn.empty(vim.fn.glob(install_path)) == 0

if not is_installed then
    if vim.fn.input("Install packer.nvim? (y for yes) ") == "y" then
        execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
        execute("packadd packer.nvim")
        print("Installed packer.nvim.")
        is_installed = 1
    end
end

-- Packer commands
vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
vim.cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
vim.cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]
vim.cmd [[command! PC PackerCompile]]
vim.cmd [[command! PS PackerStatus]]
vim.cmd [[command! PU PackerSync]]

local packer = nil
if not is_installed then return end
if packer == nil then
    packer = require('packer')
    packer.init({
        -- we don't want the compilation file in '~/.config/nvim'
        compile_path = compile_path
    })
end

local use = packer.use

-- Packer can manage itself
use 'wbthomason/packer.nvim'

-- Needed to load first
use {'lewis6991/impatient.nvim', rocks = 'mpack'}
use {'nvim-lua/plenary.nvim'}
use {"kyazdani42/nvim-web-devicons"}

-- Themes
use {'bluz71/vim-nightfly-guicolors'}

-- Treesitter
use {'nvim-treesitter/nvim-treesitter',
    config = "require('plugins.treesitter')",
    run = ':TSUpdate'}
use {'nvim-treesitter/nvim-treesitter-textobjects',
    after = {'nvim-treesitter'}}

-- Telescope
use {'nvim-telescope/telescope.nvim',
    config = "require('plugins.telescope')",
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim'}
    }
  }
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
use {'nvim-telescope/telescope-fzy-native.nvim', run = 'make' }
use {'nvim-telescope/telescope-project.nvim'}

-- General
use {"ellisonleao/glow.nvim", run = "GlowInstall"}
use {'AndrewRadev/switch.vim'}
use {'AndrewRadev/splitjoin.vim'}
use {'mbbill/undotree'}
use {'b3nj5m1n/kommentary', config = "require('plugins.kommentary')"}
use {"akinsho/nvim-toggleterm.lua", config = "require('plugins.toggleterm')"}
use {'tpope/vim-repeat'}
use {'tpope/vim-speeddating'}
use {'mhinz/vim-startify'}
use {'tpope/vim-surround'}
use {'dhruvasagar/vim-table-mode'}
use {'mg979/vim-visual-multi'}
use {'antoinemadec/openrgb.nvim', run = ':UpdateRemotePlugins'}
use {'junegunn/vim-easy-align'}
use {'JoosepAlviste/nvim-ts-context-commentstring'}
use {'nacro90/numb.nvim', config = "require('plugins.numb')"}
use {'folke/todo-comments.nvim'}
use {'folke/zen-mode.nvim', config = "require('plugins.zen')"}
use {'ggandor/lightspeed.nvim'}
use {'folke/which-key.nvim', config = "require('plugins.which-key')", event = "BufWinEnter"}
use {'glepnir/galaxyline.nvim', config = "require('plugins.galaxyline')"}
use {'romgrk/barbar.nvim', config = "require('plugins.barbar')"}
use {'folke/twilight.nvim', config = function() require("twilight").setup {} end}
use {'karb94/neoscroll.nvim', config = "require('plugins.neoscroll')"}
use {'antoinemadec/FixCursorHold.nvim'} -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open

-- Snippets & Language & Syntax
use {'windwp/nvim-autopairs', after = {'nvim-treesitter', 'nvim-cmp'}, config = "require('plugins.autopairs')"}
use {'p00f/nvim-ts-rainbow'}
use {'mattn/emmet-vim'}
use {'potatoesmaster/i3-vim-syntax'}
use {'lukas-reineke/indent-blankline.nvim' }
use {'norcalli/nvim-colorizer.lua', config = "require('plugins.colorizer')"}
use {'SirVer/ultisnips'}
use {'tpope/vim-dadbod'}
use {'kristijanhusak/vim-dadbod-ui'}
use {'hrsh7th/vim-vsnip'}
use {'kitagry/vs-snippets'}

-- LSP
use {'neovim/nvim-lspconfig', config = "require('lsp.config')"}
use {'kabouzeid/nvim-lspinstall', config = "require('lsp.install')", event = "VimEnter"}
use {'prabirshrestha/async.vim'}
use {'prabirshrestha/vim-lsp'}
use {'thomasfaingnaert/vim-lsp-snippets'}
use {'thomasfaingnaert/vim-lsp-ultisnips'}
use {'glepnir/lspsaga.nvim', config = "require('plugins.saga')"}
use {'onsails/lspkind-nvim', config = "require('plugins.kind')"}
use {'folke/lsp-trouble.nvim', config = "require('plugins.trouble')"}
use {'nvim-lua/popup.nvim'}

-- LSP Cmp
use {'hrsh7th/nvim-cmp', event = 'InsertEnter', config = "require('plugins.cmp')"}
use {'hrsh7th/cmp-vsnip', requires = "hrsh7th/nvim-cmp", after = 'nvim-cmp'}
use {'hrsh7th/cmp-buffer', requires = "hrsh7th/nvim-cmp", after = 'nvim-cmp'}
use {'hrsh7th/cmp-path', requires = "hrsh7th/nvim-cmp", after = 'nvim-cmp'}
use {'hrsh7th/cmp-calc', requires = "hrsh7th/nvim-cmp", after = 'nvim-cmp'}
use {'hrsh7th/cmp-nvim-lua', requires = "hrsh7th/nvim-cmp", after = 'nvim-cmp'}
use {'hrsh7th/cmp-nvim-lsp', requires = "hrsh7th/nvim-cmp", after = 'nvim-cmp'}
use {'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp', after = 'nvim-cmp'}

-- Nvim Tree
use {'kyazdani42/nvim-tree.lua',
  requires = { 'kyazdani42/nvim-web-devicons'},
  config = "require('plugins.tree')"
}

-- React
use {'peitalin/vim-jsx-typescript'}
use {'mlaursen/vim-react-snippets'}
use {'styled-components/vim-styled-components'}
use {'neoclide/vim-jsx-improve'}
use {'jose-elias-alvarez/nvim-lsp-ts-utils', after = {'nvim-treesitter'}}
use {'vuki656/package-info.nvim', requires = "MunifTanjim/nui.nvim", config = "require('plugins.package-info')"}

-- Git

-- use {'rhysd/git-messenger.vim', config = "require('plugins.git-messenger')"}
use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = "require('plugins.gitsigns')",
    event = "BufRead"
  }
