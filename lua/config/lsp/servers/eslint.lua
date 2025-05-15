-- Configure eslint with Neovim 0.11 API
vim.lsp.config.eslint = {
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = true
		vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
	end,
	settings = {
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
		},
		codeActionOnSave = {
			enable = false,
			mode = "all",
		},
		experimental = {
			useFlatConfig = false,
		},
		format = true,
		nodePath = "",
		onIgnoredFiles = "off",
		problems = {
			shortenToSingleLine = false,
		},
		quiet = false,
		rulesCustomizations = {},
		run = "onType",
		useESLintClass = false,
		validate = "on",
		workingDirectory = {
			mode = "location",
		},
	},
	flags = {
		allow_incremental_sync = true,
		debounce_text_changes = 2000,
		exit_timeout = 2000,
	},
}
