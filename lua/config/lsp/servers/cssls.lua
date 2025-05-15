-- Configure cssls with Neovim 0.11 API
vim.lsp.config.cssls = {
	settings = {
		css = {
			lint = {
				unknownAtRules = "ignore",
			},
		},
		scss = {
			lint = {
				unknownAtRules = "ignore",
			},
		},
	},
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = true
		client.server_capabilities.documentRangeFormattingProvider = true
	end,
}
