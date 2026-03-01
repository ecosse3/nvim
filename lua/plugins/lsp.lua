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
		opts = {
			servers = {
				['*'] = {
					keys = {
						-- Only set this keymap for servers that support code actions
						{ "<leader>cA", vim.lsp.buf.code_action, desc = "Code Action", has = "codeAction", mode = { "n", "v" } },
						-- Multiple capabilities for file rename
						{ "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File",
							has = { "workspace/didRenameFiles", "workspace/willRenameFiles" } },
						-- Only for servers with rename support
						{ "<leader>cr", vim.lsp.buf.rename, desc = "Rename Symbol", has = "rename" },
						-- Only for servers with definition support
						{ "gd", vim.lsp.buf.definition, desc = "Goto Definition", has = "definition" },
						-- Only for servers with references support
						{ "gr", function() vim.lsp.buf.references({ includeDeclaration = false }) end, desc = "Goto References", has = "references" },
						-- Only for servers with hover support
						{ "K", vim.lsp.buf.hover, desc = "Hover", has = "hover" },
						-- Only for servers with signature help
						{ "L", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp", mode = { "n", "i" } },
						-- Only for servers with type definition
						{ "gy", vim.lsp.buf.type_definition, desc = "Goto Type Definition", has = "typeDefinition" },
						-- Only for servers with document symbol
						{ "<leader>ss", vim.lsp.buf.document_symbol, desc = "Document Symbols", has = "documentSymbol" },
						-- Only for servers with workspace symbol
						{ "<leader>sS", vim.lsp.buf.workspace_symbol, desc = "Workspace Symbols", has = "workspaceSymbol" },
						-- Only for servers with implementation
						{ "gi", vim.lsp.buf.implementation, desc = "Goto Implementation", has = "implementation" },
						-- Only for servers with document formatting
						{ "<leader>cf", function() require('config.lsp.functions').format() end, desc = "Format Document", has = "documentFormatting" },
						-- Only for servers with range formatting
						{ "<leader>cf", vim.lsp.buf.format, desc = "Format Range", has = "documentRangeFormatting", mode = "v" },
					}
				}
			}
		},
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
