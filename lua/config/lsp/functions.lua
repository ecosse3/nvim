local M = {}

function M.format()
  local ok, conform = pcall(require, "conform")
  if ok then
    conform.format({ bufnr = 0, lsp_fallback = true })
  else
    vim.lsp.buf.format({ bufnr = 0 })
  end
end

function M.enable_format_on_save()
  local group = vim.api.nvim_create_augroup("format_on_save", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = M.format,
    group = group,
  })
  vim.notify("Enabled format on save", vim.log.levels.INFO, { title = "LSP" })
end

function M.disable_format_on_save()
  vim.api.nvim_del_augroup_by_name("format_on_save")
  vim.notify("Disabled format on save", vim.log.levels.INFO, { title = "LSP" })
end

function M.toggle_format_on_save()
  if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

vim.api.nvim_create_user_command("LspToggleAutoFormat", 'lua require("config.lsp.functions").toggle_format_on_save()', {})

-- Enable format on save at startup if configured (silently)
if EcoVim.lsp.format_on_save then
	local group = vim.api.nvim_create_augroup("format_on_save", { clear = true })
	vim.api.nvim_create_autocmd("BufWritePre", {
		callback = M.format,
		group = group,
	})
end

return M
