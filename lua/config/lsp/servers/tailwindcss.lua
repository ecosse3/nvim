vim.lsp.config.tailwindcss = {
	capabilities = (function()
		local blink_ok, blink = pcall(require, "blink.cmp")
		local capabilities = blink_ok and blink.get_lsp_capabilities() or vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.colorProvider = { dynamicRegistration = false }
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}
		return capabilities
	end)(),

	on_attach = function(client, bufnr)
		-- Empty on_attach maintained from original config
	end,

	filetypes = { "html", "mdx", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte" },

	init_options = {
		userLanguages = {
			eelixir = "html-eex",
			eruby = "erb",
		},
	},

	settings = {
		tailwindCSS = {
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning",
			},
			experimental = {
				classRegex = {
					"tw`([^`]*)",
					'tw="([^"]*)',
					'tw={"([^"}]*)',
					"tw\\.\\w+`([^`]*)",
					"tw\\(.*?\\)`([^`]*)",
					{ "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
					{ "classnames\\(([^)]*)\\)", "'([^']*)'" },
					{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
					{ "cn\\(([^)]*)\\)", "[\"'`]([^\"'`]*)[\"'`]" },
				},
			},
			validate = true,
		},
	},

	flags = {
		debounce_text_changes = 1000,
		exit_timeout = 1000,
	},
}
