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
				"volar",
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
			-- Mason
			{ "<leader>cm", "<cmd>Mason<CR>", desc = "Mason LSP manager" },
			{ "<leader>cli", "<cmd>LspInfo<CR>", desc = "LSP Info" },
			{ "<leader>clr", "<cmd>LspRestart<CR>", desc = "LSP Restart" },
			{ "<leader>cls", "<cmd>LspStop<CR>", desc = "LSP Stop" },
			{ "<leader>clS", "<cmd>LspStart<CR>", desc = "LSP Start" },

			-- Navigation
			{ "gd", vim.lsp.buf.definition, desc = "Goto Definition" },
			{ "gr", function() vim.lsp.buf.references({ includeDeclaration = false }) end, desc = "Goto References" },
			{ "gy", vim.lsp.buf.type_definition, desc = "Goto Type Definition" },
			{ "gi", vim.lsp.buf.implementation, desc = "Goto Implementation" },

			-- Info
			{ "K", function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end, desc = "Hover / Peek Fold" },
			{ "L", vim.lsp.buf.signature_help, desc = "Signature Help", mode = { "n", "i" } },

			-- Diagnostics
			{ "gl", function() vim.diagnostic.open_float({ border = "rounded", max_width = 100 }) end, desc = "Line Diagnostics" },
			{ "]g", function() vim.diagnostic.jump({ count = 1, float = { border = "rounded", max_width = 100 } }) end, desc = "Next Diagnostic" },
			{ "[g", function() vim.diagnostic.jump({ count = -1, float = { border = "rounded", max_width = 100 } }) end, desc = "Prev Diagnostic" },

			-- Code actions
			{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
			{ "<C-Space>", vim.lsp.buf.code_action, desc = "Code Action" },

			-- Refactoring
			{ "<leader>cr", vim.lsp.buf.rename, desc = "Rename Symbol" },
			{ "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },

			-- Formatting
			{ "<leader>cf", vim.lsp.buf.format, desc = "Format Document" },
			{ "<leader>cf", vim.lsp.buf.format, desc = "Format Range", mode = "v" },

			-- Symbols
			{ "<leader>ss", vim.lsp.buf.document_symbol, desc = "Document Symbols" },
			{ "<leader>sS", vim.lsp.buf.workspace_symbol, desc = "Workspace Symbols" },
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
