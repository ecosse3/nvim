local M = {}

function M.format()
  local root_dir = vim.fn.getcwd() -- Adjust this if you have a more accurate way to find the project root
  local eslintrc_json = root_dir .. "/.eslintrc.json"
  local eslintrc_js = root_dir .. "/.eslintrc.js"

  -- Check if eslint LSP is active
  local active_clients = vim.lsp.buf_get_clients()
  local eslint_is_active = false

  for _, client in ipairs(active_clients) do
    if client.name == "eslint" then
      eslint_is_active = true
      break
    end
  end

  if eslint_is_active and (vim.fn.filereadable(eslintrc_json) == 1 or vim.fn.filereadable(eslintrc_js) == 1) then
    vim.cmd("EslintFixAll")
  else
    vim.lsp.buf.format({ async = true })
  end
end

function M.enable_format_on_save()
  local group = vim.api.nvim_create_augroup("format_on_save", { clear = false })
  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = M.format,
    group = group,
  })
  require("notify")("Enabled format on save", "info", { title = "LSP", timeout = 2000 })
end

function M.disable_format_on_save()
  vim.api.nvim_del_augroup_by_name("format_on_save")
  require("notify")("Disabled format on save", "info", { title = "LSP", timeout = 2000 })
end

function M.toggle_format_on_save()
  if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

vim.api.nvim_create_user_command("LspToggleAutoFormat", 'lua require("config.lsp.functions").toggle_format_on_save()', {})

-- Custom textDocument/hover LSP handler to colorize colors inside hover results - WIP
function M.custom_hover_handler(_, result)
  local handler = function(_, result)
    if result then
      local colorizer = require("colorizer")

      local lines = vim.split(result.contents.value, "\n")
      local bufnr =
          vim.lsp.util.open_floating_preview(lines, "markdown", { border = EcoVim.ui.float.border or "rounded" })
      colorizer.highlight_buffer(bufnr, nil, vim.list_slice(lines, 2, #lines), 0, colorizer.get_buffer_options(0))
    end
  end

  return handler
end

return M
