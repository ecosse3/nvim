-- Configure vue_ls (Vue Language Server) with Neovim 0.11 API
-- Note: mason-lspconfig v2.1.0 renamed "volar" to "vue_ls"
-- Using non-hybrid mode since tsgo doesn't support @vue/typescript-plugin
-- In non-hybrid mode, vue_ls handles both template/CSS and TypeScript in .vue files
vim.lsp.config.vue_ls = {
	filetypes = { "vue" },

	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
	end,

	init_options = {
		vue = {
			hybridMode = false,
		},
		typescript = {
			tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
		},
	},

	settings = {
		vue = {
			codeLens = {
				references = true,
				pugTools = false,
				scriptSetupTools = true,
			},
			completion = {
				autoImport = true,
				tagCasing = "kebab",
			},
		},
	},
}
