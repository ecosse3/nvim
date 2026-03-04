-- Configure lua_ls with Neovim 0.11 API
-- Note: lazydev.nvim manages workspace.library and Neovim API types automatically
vim.lsp.config.lua_ls = {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim', 'EcoVim' },
			},
			workspace = {
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
			format = {
				enable = false, -- Let other formatters handle this
			},
			completion = {
				callSnippet = "Replace",
			},
			hint = { enable = true },
		},
	},
	on_attach = function(client, bufnr)
		-- Disable formatting for lua_ls as it will be handled by other formatters like stylua
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
}
