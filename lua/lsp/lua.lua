-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
-- USER = vim.fn.expand('$USER')
-- Get OS name
local jit = require("jit")

-- Since your lang server are in ~/.config/neovim we can use `stdpath`
local sumneko_root_path = string.format("%s/lua-language-server", vim.fn.stdpath("config"))
local sumneko_binary = string.format("%s/bin/%s/lua-language-server", sumneko_root_path, jit.os)

if vim.fn.has("mac") ~= 1 and vim.fn.has("unix") ~= 1 then
	-- print("Unsupported system for sumneko")
	-- This will display a warning type message
	vim.cmd([[echohl WarningMsg | echomsg "Unsupported system for sumneko" | echohl None]])
end

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					library = vim.api.nvim_get_runtime_file("", true),
					-- Since everyone has more ram make lsp take up more memory for performance
					maxPreload = 2000,
					preloadFileSize = 1000,
				},
			},
			telemetry = { enable = false },
		},
	},
})
