local M = {}

function M.enable_format_on_save()
  local group = vim.api.nvim_create_augroup("format_on_save", { clear = false })
  vim.api.nvim_create_autocmd("BufWritePre", { callback = function()
    vim.lsp.buf.format()
  end,
  group = group })
  require('notify')("Enabled format on save", "info", { title = "LSP", timeout = 2000 })
end

function M.disable_format_on_save()
  vim.api.nvim_del_augroup_by_name("format_on_save")
  require('notify')("Disabled format on save", "info", { title = "LSP", timeout = 2000 })
end

function M.toggle_format_on_save()
  if vim.fn.exists "#format_on_save#BufWritePre" == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

vim.api.nvim_create_user_command('LspToggleAutoFormat', 'lua require("lsp.functions").toggle_format_on_save()', {})

-- Custom textDocument/hover LSP handler to colorize colors inside hover results - WIP
function M.custom_hover_handler(_, result)
  local handler = function(_, result)
    if result then
      local lines = vim.split(result.contents.value, '\n')
      local bufnr = vim.lsp.util.open_floating_preview(lines, 'markdown', { border = EcoVim.ui.float.border or 'rounded' })
      require('colorizer').highlight_buffer(bufnr, nil, vim.list_slice(lines, 2, #lines), 0, require('colorizer').get_buffer_options(0))
    end
  end

  return handler
end

return M
