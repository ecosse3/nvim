-- Configure tsc (TypeScript 7 native Go-based language server)
-- https://github.com/microsoft/typescript
-- Note: tsgo (@typescript/native-preview) is deprecated in favor of tsc
local filter = require("config.lsp.utils.filter").filter
local filterReactDTS = require("config.lsp.utils.filterReactDTS").filterReactDTS

vim.lsp.config.tsc = {
	handlers = {
		["textDocument/definition"] = function(err, result, method, ...)
			if vim.islist(result) and #result > 1 then
				local filtered_result = filter(result, filterReactDTS)
				return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
			end
			vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
		end,
	},

	settings = {
		typescript = {
			inlayHints = {
				parameterNames = {
					enabled = "all",
					suppressWhenArgumentMatchesName = true,
				},
				parameterTypes = { enabled = true },
				variableTypes = { enabled = false },
				propertyDeclarationTypes = { enabled = false },
				functionLikeReturnTypes = { enabled = false },
				enumMemberValues = { enabled = true },
			},
		},
	},
}
