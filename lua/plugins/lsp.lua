return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"mason-org/mason.nvim",
				"mason-org/mason-lspconfig.nvim",
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
			local default_servers = {
				"bashls",
				"biome",
				"clangd",
				"cssls",
				"denols",
				"dockerls",
				"eslint",
				"graphql",
				"html",
				"jsonls",
				"lua_ls",
				"marksman",
				"oxlint",
				"prismals",
				"pyright",
				"sqlls",
				"tailwindcss",
				"terraformls",
				"tflint",
				"tsgo",
				"vuels",
				"yamlls",
			}

			-- Merge default servers with user custom servers
			local ensure_installed = vim.list_extend(default_servers, EcoVim.lsp.ensure_installed or {})

			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed,
				-- Automatically enable installed servers via vim.lsp.enable
				automatic_enable = {
					exclude = EcoVim.lsp.exclude or { "ts_ls", "copilot" },
				},
			})

			-- Load LSP configurations using vim.lsp.config API
			require("config.lsp")

			-- Load user custom LSP server configs
			for name, config in pairs(EcoVim.lsp.servers or {}) do
				vim.lsp.config(name, config)
				vim.lsp.enable(name)
			end
		end,
		keys = {
			{ "<leader>cm", "<cmd>Mason<CR>", desc = "Mason LSP manager" },
			{ "<leader>cli", "<cmd>LspInfo<CR>", desc = "LSP Info" },
			{ "<leader>clr", "<cmd>LspRestart<CR>", desc = "LSP Restart" },
			{ "<leader>cls", "<cmd>LspStop<CR>", desc = "LSP Stop" },
			{ "<leader>clS", "<cmd>LspStart<CR>", desc = "LSP Start" },
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
}
