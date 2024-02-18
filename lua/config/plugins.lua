return {
  -- Themes
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 900,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 900,
  },
  {
    "tanvirtin/monokai.nvim",
    lazy = true,
    priority = 900,
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = true,
    priority = 900,
  },
  {
    "oxfist/night-owl.nvim",
    lazy = true,
    priority = 900,
  },
  {
    "miikanissi/modus-themes.nvim",
    lazy = true,
    priority = 900,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      require("config.colorscheme")
    end,
  },
  {
    "sainnhe/everforest",
    lazy = true,
    priority = 900,
  },
  {
    "alexmozaidze/palenight.nvim",
    priority = 900,
    lazy = true,
  },
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  },
  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      require("plugins.alpha")
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    config = function()
      require("plugins.treesitter")
    end,
    dependencies = {
      "hiphish/rainbow-delimiters.nvim",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-textsubjects",
    },
  },

  -- Navigating (Telescope/Tree/Refactor)
  {
    "nvim-pack/nvim-spectre",
    lazy = true,
    keys = {
      {
        "<Leader>pr",
        "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
        desc = "refactor",
      },
      {
        "<Leader>pr",
        "<cmd>lua require('spectre').open_visual()<CR>",
        mode = "v",
        desc = "refactor",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      require("plugins.telescope")
    end,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "cljoly/telescope-repo.nvim" },
      { "nvim-telescope/telescope-frecency.nvim" },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = {
      "NvimTreeOpen",
      "NvimTreeClose",
      "NvimTreeToggle",
      "NvimTreeFindFile",
      "NvimTreeFindFileToggle",
    },
    keys = {
      { "<C-e>", "<cmd>lua require('nvim-tree.api').tree.toggle()<CR>", desc = "NvimTree" },
    },
    config = function()
      require("plugins.tree")
    end,
  },
  {
    "gbprod/stay-in-place.nvim",
    lazy = false,
    config = true, -- run require("stay-in-place").setup()
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = "Refactor",
    keys = {
      { "<leader>re", ":Refactor extract ", mode = "x", desc = "Extract function" },
      { "<leader>rf", ":Refactor extract_to_file ", mode = "x", desc = "Extract function to file" },
      { "<leader>rv", ":Refactor extract_var ", mode = "x", desc = "Extract variable" },
      { "<leader>ri", ":Refactor inline_var", mode = { "x", "n" }, desc = "Inline variable" },
      { "<leader>rI", ":Refactor inline_func", mode = "n", desc = "Inline function" },
      { "<leader>rb", ":Refactor extract_block", mode = "n", desc = "Extract block" },
      { "<leader>rf", ":Refactor extract_block_to_file", mode = "n", desc = "Extract block to file" },
    },
    config = function()
      require("refactoring").setup()
    end,
  },

  -- LSP Base
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    servers = nil,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
    },
  },
  -- linter config
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        kotlin = { "ktlint" },
        markdown = { "vale" },
        clang = { "clangtidy" },
        python = { "flake8", "pylint" },
        zsh = { "zsh" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>ll", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end,
  },
  -- Code Formatters
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          svelte = { { "prettierd", "prettier" } },
          javascript = { { "prettierd", "prettier" } },
          typescript = { { "prettierd", "prettier" } },
          javascriptreact = { { "prettierd", "prettier" } },
          typescriptreact = { { "prettierd", "prettier" } },
          json = { { "prettierd", "prettier" } },
          graphql = { { "prettierd", "prettier" } },
          java = { "google-java-format" },
          kotlin = { "ktlint" },
          ruby = { "standardrb" },
          markdown = { { "prettierd", "prettier" } },
          erb = { "htmlbeautifier" },
          html = { "htmlbeautifier" },
          bash = { "beautysh" },
          proto = { "buf" },
          rust = { "rustfmt" },
          yaml = { "yamlfix" },
          toml = { "taplo" },
          css = { { "prettierd", "prettier" } },
          scss = { { "prettierd", "prettier" } },
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>lf", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end,
  },
  -- LSP Cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("plugins.cmp")
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "saadparwaiz1/cmp_luasnip",
      { "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
      {
        cond = EcoVim.plugins.ai.tabnine.enabled,
        "tzachar/cmp-tabnine",
        build = "./install.sh",
      },
      {
        "David-Kunz/cmp-npm",
        config = function()
          require("plugins.cmp-npm")
        end,
      },
      {
        "zbirenbaum/copilot-cmp",
        cond = EcoVim.plugins.ai.copilot.enabled,
        config = function()
          require("copilot_cmp").setup()
        end,
      },
      "petertriho/cmp-git",
    },
  },

  -- LSP Addons
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require("plugins.dressing")
    end,
  },
  { "onsails/lspkind-nvim" },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("plugins.trouble")
    end,
  },
  { "nvim-lua/popup.nvim" },
  {
    "SmiteshP/nvim-navic",
    config = function()
      require("plugins.navic")
    end,
    dependencies = "neovim/nvim-lspconfig",
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        easing_function = nil,
        pre_hook = nil,
        post_hook = nil,
      })
    end,
  },
  {
    "dnlhc/glance.nvim",
    config = function()
      require("plugins.glance")
    end,
    cmd = { "Glance" },
    keys = {
      { "gd", "<cmd>Glance definitions<CR>", desc = "LSP Definition" },
      { "gr", "<cmd>Glance references<CR>", desc = "LSP References" },
      { "gm", "<cmd>Glance implementations<CR>", desc = "LSP Implementations" },
      { "gy", "<cmd>Glance type_definitions<CR>", desc = "LSP Type Definitions" },
    },
  },
  {
    "antosha417/nvim-lsp-file-operations",
    event = "LspAttach",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-tree.lua" },
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },

  -- General
  { "AndrewRadev/switch.vim", lazy = false },
  {
    "Wansmer/treesj",
    lazy = true,
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    keys = {
      { "gJ", "<cmd>TSJToggle<CR>", desc = "Toggle Split/Join" },
    },
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("plugins.comment")
    end,
  },
  {
    "LudoPinelli/comment-box.nvim",
    lazy = false,
    keys = {
      { "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", desc = "comment box" },
      { "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", mode = "v", desc = "comment box" },
    },
  },
  {
    "akinsho/nvim-toggleterm.lua",
    lazy = false,
    branch = "main",
    config = function()
      require("plugins.toggleterm")
    end,
    keys = {
      { "<Leader>at", "<cmd>ToggleTerm direction=float<CR>", desc = "terminal float" },
    },
  },
  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-speeddating", lazy = false },
  { "dhruvasagar/vim-table-mode", ft = { "markdown" } },
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "smoka7/hydra.nvim",
    },
    opts = {
      hint_config = {
        border = EcoVim.ui.float.border or "rounded",
        position = "bottom",
        show_name = false,
      },
    },
    keys = {
      {
        "<LEADER>m",
        "<CMD>MCstart<CR>",
        desc = "multicursor",
      },
      {
        "<LEADER>m",
        "<CMD>MCvisual<CR>",
        mode = "v",
        desc = "multicursor",
      },
      {
        "<C-Down>",
        "<CMD>MCunderCursor<CR>",
        desc = "multicursor down",
      },
    },
  },
  {
    "otavioschwanck/arrow.nvim",
    lazy = false,
    opts = {
      show_icons = true,
      leader_key = ";", -- this is the way to fire it up.
      always_show_path = false,
      hide_handbook = false,
      save_path = function()
        return vim.fn.stdpath("cache") .. "/arrow"
      end
    },
  },
  {
    "nacro90/numb.nvim",
    lazy = false,
    config = function()
      require("plugins.numb")
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    event = "BufEnter",
    config = function()
      require("plugins.todo-comments")
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    config = function()
      require("plugins.zen")
    end,
    cond = EcoVim.plugins.zen.enabled,
  },
  {
    "folke/twilight.nvim",
    config = true,
    cond = EcoVim.plugins.zen.enabled,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    lazy = true,
    config = function()
      require("plugins.which-key")
    end,
  },
  {
    "ecosse3/galaxyline.nvim",
    config = function()
      require("plugins.galaxyline")
    end,
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.bufremove",
    version = "*",
    config = function()
      require("mini.bufremove").setup({
        silent = true,
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.bufremove",
    },
    version = "*",
    config = function()
      require("plugins.bufferline")
    end,
    keys = {
      { "<Leader>1", "<cmd>BufferLineGoToBuffer 1<CR>" },
      { "<Leader>2", "<cmd>BufferLineGoToBuffer 2<CR>" },
      { "<Leader>3", "<cmd>BufferLineGoToBuffer 3<CR>" },
      { "<Leader>4", "<cmd>BufferLineGoToBuffer 4<CR>" },
      { "<Leader>5", "<cmd>BufferLineGoToBuffer 5<CR>" },
      { "<Leader>6", "<cmd>BufferLineGoToBuffer 6<CR>" },
      { "<Leader>7", "<cmd>BufferLineGoToBuffer 7<CR>" },
      { "<Leader>8", "<cmd>BufferLineGoToBuffer 8<CR>" },
      { "<Leader>9", "<cmd>BufferLineGoToBuffer 9<CR>" },
      { "<A-1>", "<cmd>BufferLineGoToBuffer 1<CR>" },
      { "<A-2>", "<cmd>BufferLineGoToBuffer 2<CR>" },
      { "<A-3>", "<cmd>BufferLineGoToBuffer 3<CR>" },
      { "<A-4>", "<cmd>BufferLineGoToBuffer 4<CR>" },
      { "<A-5>", "<cmd>BufferLineGoToBuffer 5<CR>" },
      { "<A-6>", "<cmd>BufferLineGoToBuffer 6<CR>" },
      { "<A-7>", "<cmd>BufferLineGoToBuffer 7<CR>" },
      { "<A-8>", "<cmd>BufferLineGoToBuffer 8<CR>" },
      { "<A-9>", "<cmd>BufferLineGoToBuffer 9<CR>" },
      { "<Leader>bb", "<cmd>BufferLineMovePrev<CR>", desc = "Move back" },
      { "<Leader>bl", "<cmd>BufferLineCloseLeft<CR>", desc = "Close Left" },
      { "<Leader>br", "<cmd>BufferLineCloseRight<CR>", desc = "Close Right" },
      { "<Leader>bn", "<cmd>BufferLineMoveNext<CR>", desc = "Move next" },
      { "<Leader>bp", "<cmd>BufferLinePick<CR>", desc = "Pick Buffer" },
      { "<Leader>bP", "<cmd>BufferLineTogglePin<CR>", desc = "Pin/Unpin Buffer" },
      { "<Leader>bsd", "<cmd>BufferLineSortByDirectory<CR>", desc = "Sort by directory" },
      { "<Leader>bse", "<cmd>BufferLineSortByExtension<CR>", desc = "Sort by extension" },
      { "<Leader>bsr", "<cmd>BufferLineSortByRelativeDirectory<CR>", desc = "Sort by relative dir" },
    },
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("plugins.notify")
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.fidget")
    end,
  },
  {
    "vuki656/package-info.nvim",
    event = "BufEnter package.json",
    config = function()
      require("plugins.package-info")
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "ahmedkhalf/project.nvim",
    event = "BufWinEnter",
    config = function()
      require("project_nvim").setup({
        -- configuration goes here.
        detection_methods = { "lsp", "pattern" },
        patterns = {
          ".git",
          "*.git",
          "_darcs",
          ".hg",
          ".bzr",
          ".svn",
          "Makefile",
          "cargo.toml",
          "package.json",
          "!.git/worktrees",
        },
        exclude_dirs = { "~/.cargo/*" },
        silent_chdir = true,
        scope_chdir = "global",
      })
    end,
  },
  {
    "Shatur/neovim-session-manager",
    lazy = false,
    config = function()
      require("plugins.session-manager")
    end,
    keys = {
      { "<Leader>/sc", "<cmd>SessionManager load_session<CR>", desc = "choose session" },
      { "<Leader>/sr", "<cmd>SessionManager delete_session<CR>", desc = "remove session" },
      { "<Leader>/sd", "<cmd>SessionManager load_current_dir_session<CR>", desc = "load current dir session" },
      { "<Leader>/sl", "<cmd>SessionManager load_last_session<CR>", desc = "load last session" },
      { "<Leader>/ss", "<cmd>SessionManager save_current_session<CR>", desc = "save session" },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = true,
  },
  {
    "sunjon/shade.nvim",
    config = function()
      require("shade").setup()
      require("shade").toggle()
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
    end,
  },
  {
    "echasnovski/mini.align",
    lazy = false,
    version = "*",
    config = function()
      require("mini.align").setup()
    end,
  },
  {
    "echasnovski/mini.ai",
    lazy = false,
    version = "*",
    config = function()
      require("mini.ai").setup()
    end,
  },
  {
    "rareitems/printer.nvim",
    event = "BufEnter",
    ft = {
      "lua",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    config = function()
      require("plugins.printer")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    main = "ibl",
    config = function()
      require("plugins.indent")
    end,
  },
  {
    "folke/noice.nvim",
    cond = EcoVim.plugins.experimental_noice.enabled,
    lazy = false,
    config = function()
      require("plugins.noice")
    end,
  },
  {
    "chrisgrieser/nvim-spider",
    cond = EcoVim.plugins.jump_by_subwords.enabled,
    lazy = true,
    keys = { "w", "e", "b", "ge" },
    config = function()
      vim.keymap.set({ "n", "o", "x" }, "W", "w", { desc = "Normal w" })
      vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
      vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
      vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
      vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
    end,
  },

  -- Snippets & Language & Syntax
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("plugins.autopairs")
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("plugins.colorizer")
    end,
  },

  -- AI
  {
    "jcdickinson/codeium.nvim",
    cond = EcoVim.plugins.ai.codeium.enabled,
    event = "InsertEnter",
    cmd = "Codeium",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = true,
  },
  {
    "zbirenbaum/copilot.lua",
    cond = EcoVim.plugins.ai.copilot.enabled,
    event = "InsertEnter",
    config = function()
      require("plugins.copilot")
    end,
  },
  {
    "Bryley/neoai.nvim",
    cond = EcoVim.plugins.ai.chatgpt.enabled,
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "NeoAI",
      "NeoAIOpen",
      "NeoAIClose",
      "NeoAIToggle",
      "NeoAIContext",
      "NeoAIContextOpen",
      "NeoAIContextClose",
      "NeoAIInject",
      "NeoAIInjectCode",
      "NeoAIInjectContext",
      "NeoAIInjectContextCode",
    },
    keys = {
      { "<leader>as", desc = "summarize text" },
      { "<leader>ag", desc = "generate git message" },
    },
    config = true,
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.git.signs")
    end,
    keys = {
      { "<Leader>ghd", desc = "diff hunk" },
      { "<Leader>ghp", desc = "preview" },
      { "<Leader>ghR", desc = "reset buffer" },
      { "<Leader>ghr", desc = "reset hunk" },
      { "<Leader>ghs", desc = "stage hunk" },
      { "<Leader>ghS", desc = "stage buffer" },
      { "<Leader>ght", desc = "toggle deleted" },
      { "<Leader>ghu", desc = "undo stage" },
    },
  },
  {
    "sindrets/diffview.nvim",
    lazy = true,
    enabled = true,
    event = "BufRead",
    config = function()
      require("plugins.git.diffview")
    end,
    keys = {
      { "<Leader>gd", "<cmd>lua require('plugins.git.diffview').toggle_file_history()<CR>", desc = "diff file" },
      { "<Leader>gS", "<cmd>lua require('plugins.git.diffview').toggle_status()<CR>", desc = "status" },
    },
  },
  {
    "akinsho/git-conflict.nvim",
    lazy = false,
    config = function()
      require("plugins.git.conflict")
    end,
    keys = {
      { "<Leader>gcb", "<cmd>GitConflictChooseBoth<CR>", desc = "choose both" },
      { "<Leader>gcn", "<cmd>GitConflictNextConflict<CR>", desc = "move to next conflict" },
      { "<Leader>gcc", "<cmd>GitConflictChooseOurs<CR>", desc = "choose current" },
      { "<Leader>gcp", "<cmd>GitConflictPrevConflict<CR>", desc = "move to prev conflict" },
      { "<Leader>gci", "<cmd>GitConflictChooseTheirs<CR>", desc = "choose incoming" },
    },
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    lazy = false,
    config = function()
      require("plugins.git.worktree")
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup({
        disable_hint = false,
        disable_context_hightlighting = false,
        disable_signs = false,
        graphstyle = "unicode",
        remember_settings = true,
        telescope_sorter = nil,
      })
    end,
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = {
      "Octo",
    },
    config = function()
      require("plugins.git.octo")
    end,
  },

  -- Testing
  {
    "rcarriga/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
    config = function()
      require("plugins.neotest")
    end,
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = {
      "Coverage",
      "CoverageSummary",
      "CoverageLoad",
      "CoverageShow",
      "CoverageHide",
      "CoverageToggle",
      "CoverageClear",
    },
    config = function()
      require("coverage").setup()
    end,
  },

  -- DAP
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.dap")
    end,
    keys = {
      "<Leader>da",
      "<Leader>db",
      "<Leader>dc",
      "<Leader>dd",
      "<Leader>dh",
      "<Leader>di",
      "<Leader>do",
      "<Leader>dO",
      "<Leader>dt",
    },
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "mxsdev/nvim-dap-vscode-js",
    },
  },
  {
    "LiadOz/nvim-dap-repl-highlights",
    config = true,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
    },
    build = function()
      if not require("nvim-treesitter.parsers").has_parser("dap_repl") then
        vim.cmd(":TSInstall dap_repl")
      end
    end,
  },
  {
    "lukas-reineke/virt-column.nvim",
    dev = true,
    config = function ()
      require("virt-column").setup {}
      require("virt-column").overwrite {
        virtcolumn = "+1",
        hightlight = "VirtColumn",
        exclude = {
          filetypes = {
            "lspinfo",
            "packer",
            "checkhealth",
            "man",
            "TelescopePrompt",
            "TelesecopeResults",
          },
        },
      }
    end,
  },
  {
    "chrisgrieser/nvim-early-retirement",
    opts = {
      retirementAgeMins = 20,
    },
    event = "VeryLazy",
  },
  {
    "TobinPalmer/Tip.nvim",
    event = "VimEnter",
    init = function()
      -- Default config
      -- @type Tip.config
      require("tip").setup({
        title = "Tip!",
        url = "https://vtip.43z.one",
      })
    end,
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle the outline view" },
    },
    opts = {
      -- when we need extra options.
      width = 20, -- only use 20% of the realestate.
    },
  },
  {
    "simrat39/rust-tools.nvim",
    opts = {},
  },
  {
    "wakatime/vim-wakatime",
    lazy = false,
    config = function()
      -- I think I need to do something, but this is the most
      -- innocent thing I can come up with. It also makes it easy
      -- to enable debugging if I want that.
      vim.cmd(":WakaTimeDebugDisable")
    end,
    opts = {},
  },
}
