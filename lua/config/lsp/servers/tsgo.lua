-- Configure tsgo (Microsoft's native Go-based TypeScript server)
-- https://github.com/microsoft/typescript-go
local filter = require("config.lsp.utils.filter").filter
local filterReactDTS = require("config.lsp.utils.filterReactDTS").filterReactDTS

vim.lsp.config.tsgo = {
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
