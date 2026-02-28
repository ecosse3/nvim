return {
	{
		"pmizio/typescript-tools.nvim",
		enabled = false,
		-- "Yuki-bun/typescript-tools.nvim",
		-- branch = "refac-use_native_lsp_api",
		event = "BufReadPre",
		ft = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
			{
				"saghen/blink.cmp",
				-- Ensure blink.cmp is loaded before typescript-tools
				lazy = false,
				priority = 1000,
			},
		},
		config = function()
			-- typescript-tools replaces the standard tsserver LSP completely
			-- This is using the separate plugin setup function, not vim.lsp.config
			require("typescript-tools").setup({
				capabilities = require("blink.cmp").get_lsp_capabilities(),
				handlers = require("config.lsp.servers.tsserver").handlers,
				on_attach = require("config.lsp.servers.tsserver").on_attach,
				settings = require("config.lsp.servers.tsserver").settings,
			})
		end,
	},

	{
		"razak17/tailwind-fold.nvim",
		opts = {
			min_chars = 50,
		},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = { "html", "svelte", "astro", "vue", "typescriptreact" },
	},

	{
		"MaximilianLloyd/tw-values.nvim",
		keys = {
			{ "<Leader>cv", "<CMD>TWValues<CR>", desc = "Tailwind CSS values" },
		},
		opts = {
			border = EcoVim.ui.float.border or "rounded", -- Valid window border style,
			show_unknown_classes = true, -- Shows the unknown classes popup
		},
	},

	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},

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
		"dmmulroy/tsc.nvim",
		cmd = { "TSC" },
		config = true,
	},

	{
		"dmmulroy/ts-error-translator.nvim",
		config = true,
	},

	{
		"monaqa/dial.nvim",
		config = function()
			vim.keymap.set("n", "<C-a>", function()
				require("dial.map").manipulate("increment", "normal")
			end)
			vim.keymap.set("n", "<C-x>", function()
				require("dial.map").manipulate("decrement", "normal")
			end)
			vim.keymap.set("n", "g<C-a>", function()
				require("dial.map").manipulate("increment", "gnormal")
			end)
			vim.keymap.set("n", "g<C-x>", function()
				require("dial.map").manipulate("decrement", "gnormal")
			end)
			vim.keymap.set("x", "<C-a>", function()
				require("dial.map").manipulate("increment", "visual")
			end)
			vim.keymap.set("x", "<C-x>", function()
				require("dial.map").manipulate("decrement", "visual")
			end)
			vim.keymap.set("x", "g<C-a>", function()
				require("dial.map").manipulate("increment", "gvisual")
			end)
			vim.keymap.set("x", "g<C-x>", function()
				require("dial.map").manipulate("decrement", "gvisual")
			end)
			vim.keymap.set("n", "<D-a>", function()
				require("dial.map").manipulate("indrement", "normal")
			end)
			vim.keymap.set("n", "<D-x>", function()
				require("dial.map").manipulate("dedrement", "normal")
			end)
			vim.keymap.set("n", "g<D-a>", function()
				require("dial.map").manipulate("indrement", "gnormal")
			end)
			vim.keymap.set("n", "g<D-x>", function()
				require("dial.map").manipulate("dedrement", "gnormal")
			end)
			vim.keymap.set("x", "<D-a>", function()
				require("dial.map").manipulate("indrement", "visual")
			end)
			vim.keymap.set("x", "<D-x>", function()
				require("dial.map").manipulate("dedrement", "visual")
			end)
			vim.keymap.set("x", "g<D-a>", function()
				require("dial.map").manipulate("indrement", "gvisual")
			end)
			vim.keymap.set("x", "g<D-x>", function()
				require("dial.map").manipulate("dedrement", "gvisual")
			end)
		end,
	},

	{
		"ruicsh/tailwindcss-dial.nvim",
		dependencies = { "monaqa/dial.nvim" },
		opts = {
			-- group = "default", -- optional, defaults to "default"
		},
	},
}
