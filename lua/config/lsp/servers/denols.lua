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
		local ok, util = pcall(require, "lspconfig.util")
		if not ok then return end
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
		unstable = {},
	},
	settings = {
		deno = {
			enable = true,
			lint = true,
			suggest = {
				imports = {
					hosts = {
						["https://deno.land"] = true,
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
