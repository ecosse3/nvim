return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"mason-org/mason.nvim",
				"mason-org/mason-lspconfig.nvim",
				keys = {
					{ "<leader>cm", "<cmd>Mason<CR>", desc = "Mason" },
				},
			},
		},
		config = function()
			-- Load diagnostic configuration
			require("config.lsp.config")
			-- Load LSP functions
			require("config.lsp.functions")

			-- Set up Mason
			require("mason").setup({
				ui = {
					border = EcoVim.ui.float.border or "rounded",
				},
			})

			-- Set up Mason-lspconfig
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"cssls",
					"eslint",
					"graphql",
					"html",
					"jsonls",
					"lua_ls",
					"prismals",
					"tailwindcss",
				},
				-- Automatically enable installed servers via vim.lsp.enable
				-- Exclude ts_ls as it's handled by typescript-tools.nvim
				automatic_enable = {
					exclude = { "ts_ls", "copilot" },
				},
			})

			-- Load LSP configurations using vim.lsp.config API
			require("config.lsp")
		end,
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
}
