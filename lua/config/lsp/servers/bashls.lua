-- Configure bashls with Neovim 0.11 API
vim.lsp.config.bashls = {
	filetypes = { "sh", "bash", "zsh" },
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = true
	end,
	settings = {
		bashIde = {
			globPattern = "*@(.sh|.inc|.bash|.command)",
			shellcheckPath = "shellcheck",
			enableSourceErrorDiagnostics = true,
		},
	},
	root_dir = function(fname, on_dir)
		-- Find root directory containing typical bash project files
		local util = require("lspconfig.util")
		local roots = util.root_pattern(".git", ".bashrc", "shell.nix")(fname)
		if roots then
			on_dir(roots)
		else
			-- Default to current directory
			on_dir(vim.fn.getcwd())
		end
	end,
}

