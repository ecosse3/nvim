return {
  { 'nvim-lua/plenary.nvim' },
  { 'kyazdani42/nvim-web-devicons',
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  },
  { 'goolord/alpha-nvim',
    lazy = false,
    config = function() require('plugins.alpha') end },

  -- Themes
  { 'folke/tokyonight.nvim' },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter',
    event = "BufReadPre",
    config = function() require('plugins.treesitter') end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'RRethy/nvim-treesitter-textsubjects',
      { 'm-demare/hlargs.nvim', config = function() require('hlargs').setup({ color = "#F7768E" }) end },
    }
  },

  -- Navigating (Telescope/Tree/Refactor)
  { 'nvim-telescope/telescope.nvim',
    lazy = false,
    config = function() require('plugins.telescope') end,
    dependencies = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make' },
      { 'cljoly/telescope-repo.nvim' },
    },
  },
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },
  { 'nvim-pack/nvim-spectre' },
  { 'kyazdani42/nvim-tree.lua',
    keys = {
      { "<C-e>", "<cmd>lua require'nvim-tree'.toggle()<CR>", desc = "NvimTree" },
    },
    config = function() require('plugins.tree') end },
  { 'gbprod/stay-in-place.nvim',
    lazy = false,
    config = function()
      require('stay-in-place').setup({})
    end
  },

  -- LSP Base
  { 'williamboman/mason.nvim', cmd = "Mason" },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },

  -- LSP Cmp
  { 'hrsh7th/nvim-cmp', event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      'saadparwaiz1/cmp_luasnip',
      { 'tzachar/cmp-tabnine', build = './install.sh' },
      { 'David-Kunz/cmp-npm', config = function() require('plugins.cmp-npm') end },
      {
        'zbirenbaum/copilot-cmp',
        disable = not EcoVim.plugins.copilot.enabled,
        config = function()
          require('copilot_cmp').setup()
        end
      },
    },
    config = function() require('plugins.cmp') end },

  -- LSP Addons
  { 'stevearc/dressing.nvim', event = "VeryLazy", dependencies = 'MunifTanjim/nui.nvim',
    config = function() require('plugins.dressing') end },
  { 'onsails/lspkind-nvim' },
  { 'folke/trouble.nvim',
    cmd = { "TroubleToggle", "Trouble" },
    config = function() require('plugins.trouble') end },
  { 'nvim-lua/popup.nvim' },
  { 'ChristianChiarulli/nvim-gps', branch = 'text_hl', config = function() require('plugins.gps') end },
  { 'jose-elias-alvarez/typescript.nvim' },
  { 'axelvc/template-string.nvim', config = function() require('template-string').setup() end },
  { 'lvimuser/lsp-inlayhints.nvim', branch = 'anticonceal', config = function() require('plugins.inlay-hints') end },

  -- General
  { 'AndrewRadev/switch.vim', lazy = false },
  { 'AndrewRadev/splitjoin.vim' },
  { 'numToStr/Comment.nvim', branch = "jsx", config = function() require('plugins.comment') end },
  { 'LudoPinelli/comment-box.nvim' },
  { 'akinsho/nvim-toggleterm.lua', branch = 'main', config = function() require('plugins.toggleterm') end },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-speeddating' },
  { 'dhruvasagar/vim-table-mode', ft = { "markdown" } },
  { 'mg979/vim-visual-multi', config = function() vim.g.VM_leader = ";" end },
  { 'JoosepAlviste/nvim-ts-context-commentstring' },
  { 'nacro90/numb.nvim', lazy = false, config = function() require('plugins.numb') end },
  { 'folke/todo-comments.nvim', config = function() require('plugins.todo-comments') end },
  { 'folke/zen-mode.nvim', config = function() require('plugins.zen') end, disable = not EcoVim.plugins.zen.enabled },
  { 'folke/twilight.nvim', config = function() require("twilight").setup {} end,
    disable = not EcoVim.plugins.zen.enabled },
  { 'ggandor/lightspeed.nvim', config = function() require('plugins.lightspeed') end },
  { 'folke/which-key.nvim', config = function() require('plugins.which-key') end },
  { 'ecosse3/galaxyline.nvim', config = function() require('plugins.galaxyline') end, event = "BufWinEnter" },
  { 'romgrk/barbar.nvim', dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('plugins.barbar') end },
  { 'antoinemadec/FixCursorHold.nvim' }, -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  { 'rcarriga/nvim-notify' },
  { 'vuki656/package-info.nvim', event = "BufEnter package.json", config = function() require('plugins.package-info') end },
  { 'iamcco/markdown-preview.nvim', build = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" } },
  { 'declancm/cinnamon.nvim', config = function() require('plugins.cinnamon') end },
  { 'airblade/vim-rooter', setup = function() vim.g.rooter_patterns = EcoVim.plugins.rooter.patterns end },
  { 'Shatur/neovim-session-manager', lazy = false, config = function() require('plugins.session-manager') end },
  { 'kylechui/nvim-surround', config = function() require("nvim-surround").setup({}) end },
  { 'sunjon/shade.nvim', config = function() require("shade").setup(); require("shade").toggle(); end },
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async',
    config = function()
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
      vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
    end },
  { 'echasnovski/mini.align',
    lazy = false,
    config = function() require("mini.align").setup() end,
  },
  { 'rareitems/printer.nvim', config = function() require('plugins.printer') end },

  -- Snippets & Language & Syntax
  { 'windwp/nvim-autopairs', config = function() require('plugins.autopairs') end },
  { 'p00f/nvim-ts-rainbow' },
  { 'NvChad/nvim-colorizer.lua', config = function() require('plugins.colorizer') end },
  { 'L3MON4D3/LuaSnip', dependencies = 'rafamadriz/friendly-snippets' },
  {
    'zbirenbaum/copilot.lua',
    disable = not EcoVim.plugins.copilot.enabled,
    event = "InsertEnter",
    config = function()
      require('copilot').setup()
    end,
  },

  -- Git
  { 'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugins.git.signs') end,
    event = "BufRead"
  },
  { 'sindrets/diffview.nvim',
    event = "BufRead",
    config = function() require('plugins.git.diffview') end },
  { 'akinsho/git-conflict.nvim', config = function() require('plugins.git.conflict') end },
  { 'ThePrimeagen/git-worktree.nvim', config = function() require('plugins.git.worktree') end },
  { 'kdheepak/lazygit.nvim', lazy = false },

  -- Testing
  {
    'rcarriga/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'haydenmeade/neotest-jest'
    },
    config = function() require('plugins.neotest') end
  },

  -- DAP
  { 'theHamsta/nvim-dap-virtual-text' },
  { 'rcarriga/nvim-dap-ui' },
  { 'mfussenegger/nvim-dap', config = function() require('plugins.dap') end }
}
