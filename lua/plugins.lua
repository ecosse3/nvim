local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compile_path = install_path .. "/plugin/packer_compiled.lua"
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup({
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Needed to load first
    use { 'lewis6991/impatient.nvim' }
    use { 'nathom/filetype.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'glepnir/dashboard-nvim', config = "require('plugins.dashboard')" }

    -- Themes
    use { 'bluz71/vim-nightfly-guicolors' }
    use { 'folke/tokyonight.nvim' }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', config = "require('plugins.treesitter')" }
    use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } }
    use { 'RRethy/nvim-treesitter-textsubjects', after = { 'nvim-treesitter' } }
    use { 'm-demare/hlargs.nvim', config = function() require('hlargs').setup() end }

    -- Telescope
    use { 'nvim-telescope/telescope.nvim',
      config = "require('plugins.telescope')",
      requires = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim' }
      }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'cljoly/telescope-repo.nvim' }

    -- LSP Base
    use { 'neovim/nvim-lspconfig' }

    -- LSP Cmp
    use { 'hrsh7th/nvim-cmp', event = 'InsertEnter', config = "require('plugins.cmp')" }
    use { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp', after = 'cmp-nvim-lua' }
    use { 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-path', after = 'cmp-buffer' }
    use { 'hrsh7th/cmp-cmdline', after = 'cmp-path' }
    use { 'hrsh7th/cmp-calc', after = 'cmp-cmdline' }
    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp', after = 'cmp-calc' }
    use { 'David-Kunz/cmp-npm', after = 'cmp-tabnine', requires = 'nvim-lua/plenary.nvim', config = "require('plugins.cmp-npm')" }
    use { 'saadparwaiz1/cmp_luasnip', after = 'cmp-npm' }

    -- LSP Addons
    use { 'williamboman/nvim-lsp-installer', event = 'BufEnter', after = 'cmp-nvim-lsp' }
    use { 'stevearc/dressing.nvim', requires = 'MunifTanjim/nui.nvim', config = "require('plugins.dressing')" }
    use { 'onsails/lspkind-nvim' }
    use { 'folke/lsp-trouble.nvim', config = "require('plugins.trouble')" }
    use { 'nvim-lua/popup.nvim' }
    use { 'SmiteshP/nvim-gps', config = "require('plugins.gps')", after = 'nvim-treesitter' }
    use { 'jose-elias-alvarez/typescript.nvim' }

    -- General
    use { 'AndrewRadev/switch.vim' }
    use { 'AndrewRadev/splitjoin.vim' }
    use { 'numToStr/Comment.nvim', config = "require('plugins.comment')" }
    use { 'akinsho/nvim-toggleterm.lua', branch = 'main', config = "require('plugins.toggleterm')" }
    use { 'tpope/vim-repeat' }
    use { 'tpope/vim-speeddating' }
    use { 'tpope/vim-surround' }
    use { 'dhruvasagar/vim-table-mode' }
    use { 'mg979/vim-visual-multi' }
    use { 'junegunn/vim-easy-align' }
    use { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' }
    use { 'nacro90/numb.nvim', config = "require('plugins.numb')" }
    use { 'folke/todo-comments.nvim', config = "require('plugins.todo-comments')" }
    use { 'folke/zen-mode.nvim', config = "require('plugins.zen')", disable = not EcoVim.plugins.zen.enabled }
    use { 'folke/twilight.nvim', config = function() require("twilight").setup {} end, disable = not EcoVim.plugins.zen.enabled }
    use { 'ggandor/lightspeed.nvim' }
    use { 'folke/which-key.nvim', config = "require('plugins.which-key')", event = "BufWinEnter" }
    use { 'ecosse3/galaxyline.nvim', after = 'nvim-gps', config = "require('plugins.galaxyline')" }
    use { 'romgrk/barbar.nvim', config = "require('plugins.barbar')" }
    use { 'antoinemadec/FixCursorHold.nvim' } -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
    use { 'rcarriga/nvim-notify' }
    use { 'vuki656/package-info.nvim', disable = not EcoVim.plugins.package_info.enabled }
    use { 'iamcco/markdown-preview.nvim',
      run = 'cd app && npm install',
      setup = function()
        vim.g.mkdp_filetypes = { 'markdown' }
      end,
      ft = { 'markdown' }
    }
    use { 'declancm/cinnamon.nvim', config = "require('plugins.cinnamon')" }
    use { 'nvim-pack/nvim-spectre' }

    -- Snippets & Language & Syntax
    use { 'windwp/nvim-autopairs', after = { 'nvim-treesitter', 'nvim-cmp' }, config = "require('plugins.autopairs')" }
    use { 'p00f/nvim-ts-rainbow', after = { 'nvim-treesitter' } }
    use { 'mattn/emmet-vim' }
    use { 'lukas-reineke/indent-blankline.nvim', config = "require('plugins.indent')" }
    use { 'norcalli/nvim-colorizer.lua', config = "require('plugins.colorizer')" }
    use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' }, after = 'cmp_luasnip' }

    -- Nvim Tree / Rooter
    use { 'kyazdani42/nvim-tree.lua', config = "require('plugins.tree')" }
    use { 'airblade/vim-rooter', setup = function() vim.g.rooter_patterns = EcoVim.plugins.rooter.patterns end }

    -- Git
    use { 'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = "require('plugins.gitsigns')",
      event = "BufRead"
    }
    use { 'sindrets/diffview.nvim' }
    use { 'akinsho/git-conflict.nvim', config = function() require('git-conflict').setup() end }

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    compile_path = compile_path,
    disable_commands = true,
  }
})
