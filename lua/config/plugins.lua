return {
	-- Themes
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
			require("config.colorscheme")
		end,
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
			"mrjones2014/nvim-ts-rainbow",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-textsubjects",
			{
				"m-demare/hlargs.nvim",
				disable = true,
				config = function()
					require("hlargs").setup({ color = "#F7768E" })
				end,
			},
		},
	},

	-- Navigating (Telescope/Tree/Refactor)
	{ "nvim-pack/nvim-spectre" },
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		config = function()
			require("plugins.telescope")
		end,
		dependencies = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "cljoly/telescope-repo.nvim" },
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
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

	-- LSP Base
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
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

	-- Formatters
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufNewFile",
		dependencies = { "mason.nvim" },
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("plugins.null-ls")
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
			{ "tzachar/cmp-tabnine", build = "./install.sh" },
			{
				"David-Kunz/cmp-npm",
				config = function()
					require("plugins.cmp-npm")
				end,
			},
			{
				"zbirenbaum/copilot-cmp",
				disable = not EcoVim.plugins.copilot.enabled,
				config = function()
					require("copilot_cmp").setup()
				end,
			},
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
		"ChristianChiarulli/nvim-gps",
		branch = "text_hl",
		config = function()
			require("plugins.gps")
		end,
	},
	{ "jose-elias-alvarez/typescript.nvim" },
	{
		"axelvc/template-string.nvim",
		event = "InsertEnter",
		ft = {
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
		},
		config = true, -- run require("template-string").setup()
	},
	{
		"lvimuser/lsp-inlayhints.nvim",
		branch = "main", -- or "anticonceal"
		config = function()
			require("plugins.inlay-hints")
		end,
	},
	{
		"barrett-ruth/import-cost.nvim",
		build = "sh install.sh yarn",
		ft = {
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
		},
		config = true,
	},

	-- General
	{ "AndrewRadev/switch.vim", lazy = false },
	-- { "AndrewRadev/splitjoin.vim", lazy = false },
	{
		"Wansmer/treesj",
		lazy = true,
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
		keys = {
			{ "gJ", "<cmd>TSJToggle<CR>", desc = "Trigger Toggle Split/Join" },
		},
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		branch = "jsx",
		config = function()
			require("plugins.comment")
		end,
	},
	{ "LudoPinelli/comment-box.nvim" },
	{
		"akinsho/nvim-toggleterm.lua",
		lazy = false,
		branch = "main",
		config = function()
			require("plugins.toggleterm")
		end,
	},
	{ "tpope/vim-repeat", lazy = false },
	{ "tpope/vim-speeddating", lazy = false },
	{ "dhruvasagar/vim-table-mode", ft = { "markdown" } },
	{
		"mg979/vim-visual-multi",
		keys = {
			"<C-n>",
			"<C-Up>",
			"<C-Down>",
			"<S-Up>",
			"<S-Down>",
			"<S-Left>",
			"<S-Right>",
		},
		config = function()
			vim.g.VM_leader = ";"
		end,
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
		disable = not EcoVim.plugins.zen.enabled,
	},
	{
		"folke/twilight.nvim",
		config = true,
		disable = not EcoVim.plugins.zen.enabled,
	},
	{
		"ggandor/lightspeed.nvim",
		keys = "s",
		config = function()
			require("plugins.lightspeed")
		end,
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
		"romgrk/barbar.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "BufAdd",
		config = function()
			require("plugins.barbar")
		end,
	},
	{ "antoinemadec/FixCursorHold.nvim" }, -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
		end,
		init = function()
			local banned_messages = {
				"No information available",
				"LSP[tsserver] Inlay Hints request failed. Requires TypeScript 4.4+.",
				"LSP[tsserver] Inlay Hints request failed. File not opened in the editor.",
			}
			vim.notify = function(msg, ...)
				for _, banned in ipairs(banned_messages) do
					if msg == banned then
						return
					end
				end
				require("notify")(msg, ...)
			end
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
		"declancm/cinnamon.nvim",
		disable = true,
		config = function()
			require("plugins.cinnamon")
		end,
	},
	{
		"airblade/vim-rooter",
		setup = function()
			vim.g.rooter_patterns = EcoVim.plugins.rooter.patterns
		end,
	},
	{
		"Shatur/neovim-session-manager",
		lazy = false,
		config = function()
			require("plugins.session-manager")
		end,
	},
	{ "kylechui/nvim-surround", lazy = false, config = true },
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
		version = false,
		config = function()
			require("mini.align").setup()
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
		config = function()
			require("plugins.indent")
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
	{
		"zbirenbaum/copilot.lua",
		disable = not EcoVim.plugins.copilot.enabled,
		event = "InsertEnter",
		config = true,
	},
	{
		"jackMort/ChatGPT.nvim",
		config = function()
			require("plugins.chat-gpt")
		end,
		cmd = {
			"ChatGPT",
			"ChatGPTEditWithInstructions",
		},
	},

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.git.signs")
		end,
	},
	{
		"sindrets/diffview.nvim",
		lazy = false,
		event = "BufRead",
		config = function()
			require("plugins.git.diffview")
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		lazy = false,
		config = function()
			require("plugins.git.conflict")
		end,
	},
	{
		"ThePrimeagen/git-worktree.nvim",
		keys = {
			"<Leader>gwc",
			"<Leader>gww",
		},
		config = function()
			require("plugins.git.worktree")
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitCurrentFile",
			"LazyGitFilterCurrentFile",
			"LazyGitFilter",
		},
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 1
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
		},
	},
}
