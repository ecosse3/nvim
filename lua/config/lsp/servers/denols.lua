-- Configure denols with Neovim 0.11 API
vim.lsp.config.denols = {
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"markdown",
	},
	root_dir = function(fname, on_dir)
		local util = require("lspconfig.util")
		local root_patterns = {
			"deno.json",
			"deno.jsonc",
			"deps.ts",
			"import_map.json",
		}
		local root = util.root_pattern(unpack(root_patterns))(fname)
		if root then
			on_dir(root)
		end
	end,
	init_options = {
		enable = true,
		lint = true,
		unstable = false,
		importMap = "./import_map.json",
	},
	settings = {
		deno = {
			enable = true,
			lint = true,
			unstable = false,
			suggest = {
				imports = {
					hosts = {
						["https://deno.land"] = true,
						["https://cdn.nest.land"] = true,
						["https://crux.land"] = true,
					},
				},
			},
			inlayHints = {
				parameterNames = {
					enabled = "all",
				},
				parameterTypes = {
					enabled = true,
				},
				variableTypes = {
					enabled = true,
				},
				propertyDeclarationTypes = {
					enabled = true,
				},
				functionLikeReturnTypes = {
					enabled = true,
				},
				enumMemberValues = {
					enabled = true,
				},
			},
		},
	},
	-- To avoid conflicts with tsserver or other JavaScript/TypeScript LSPs
	single_file_support = false,
}

