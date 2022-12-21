local M = {}

function M.format(bufnr)
	vim.lsp.buf.format({
		bufnr = bufnr,
	})
end

function M.setup_autoformat(client, buf)
	local ft = vim.api.nvim_buf_get_option(buf, "filetype")
	local nls = require("plugins.null-ls")

	local enable = false
	if nls.has_formatter(ft) then
		enable = client.name == "null-ls"
	else
		enable = not (client.name == "null-ls")
	end

	if client.name == "tsserver" then
		enable = false
	end

	client.server_capabilities.documentFormattingProvider = enable
	-- format on save
	if client.server_capabilities.documentFormattingProvider then
		vim.cmd([[
		augroup LspFormat
		  autocmd! * <buffer>
		  autocmd BufWritePre <buffer> lua require("lsp.formatting").format()
		augroup END
	  ]])
	end
end

return M
