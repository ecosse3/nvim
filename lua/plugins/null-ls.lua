local M = {}

function M.setup(options)
	local present, nls = pcall(require, "null-ls")
	if not present then
		vim.notify("null-ls is not installed")
		return
	end
	local builtins = nls.builtins

	local sources = {
		builtins.formatting.stylua,
		builtins.formatting.prettier,
	}

	nls.setup({
		debug = true,
		debounce = 150,
		save_after_format = false,
		sources = sources,
		on_attach = options.on_attach,
		update_in_insert = false,
		root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git", "Makefile"),
	})
end

function M.has_formatter(ft)
	local sources = require("null-ls.sources")
	local available = sources.get_available(ft, "NULL_LS_FORMATTING")
	return #available > 0
end

return M;
