-- Configure ts_ls (TypeScript Language Server) with Neovim 0.11 API
-- This is the stable, traditional TypeScript server (typescript-language-server)
-- To use this instead of tsgo, set EcoVim.lsp.typescript_server = "ts_ls" in user.lua
local filter = require("config.lsp.utils.filter").filter
local filterReactDTS = require("config.lsp.utils.filterReactDTS").filterReactDTS

vim.lsp.config.ts_ls = {
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},

	handlers = {
		["textDocument/definition"] = function(err, result, method, ...)
			if vim.islist(result) and #result > 1 then
				local filtered_result = filter(result, filterReactDTS)
				return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
			end
			vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
		end,
	},

	on_attach = function(client, bufnr)
		if EcoVim.lsp.inlay_hints then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end
	end,

	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = false,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = false,
				includeInlayFunctionLikeReturnTypeHints = false,
				includeInlayEnumMemberValueHints = true,
			},
			format = {
				indentSize = vim.o.shiftwidth,
				convertTabsToSpaces = vim.o.expandtab,
				tabSize = vim.o.tabstop,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = false,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = false,
				includeInlayFunctionLikeReturnTypeHints = false,
				includeInlayEnumMemberValueHints = true,
			},
			format = {
				indentSize = vim.o.shiftwidth,
				convertTabsToSpaces = vim.o.expandtab,
				tabSize = vim.o.tabstop,
			},
		},
		completions = {
			completeFunctionCalls = true,
		},
	},
}
