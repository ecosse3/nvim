local lspui = require 'lspconfig/_lspui'

return function ()
  local buf_clients = vim.lsp.buf_get_clients()
  local win_info = lspui.percentage_range_window(0.8, 0.7)
  local bufnr, win_id = win_info.bufnr, win_info.win_id

  local buf_lines = {}

  local buf_client_names = {}
  for _, client in ipairs(buf_clients) do
    table.insert(buf_client_names, client.name)
  end

  local function available_capabilities(resolved_capabilities)
    -- these are the capabilities that might be interesting to the user
    local display_keys = {
      "call_hierarchy",
      "code_action",
      "code_lens",
      "completion",
      "declaration",
      "document_formatting",
      "document_highlight",
      "document_range_formatting",
      "document_symbol",
      "execute_command",
      "find_references",
      "goto_definition",
      "hover",
      "implementation",
      "rename",
      "signature_help",
      "type_definition",
    }
    return vim.tbl_filter(function(key)
      -- keep only the capabilities that are interesting & available
      return vim.tbl_contains(display_keys, key) and resolved_capabilities[key] == true
    end, vim.tbl_keys(resolved_capabilities))
  end

  local function make_client_info(client)
    return {
      "Client: "..client.name.." (id "..tostring(client.id)..")",
      "resolved: \t"..table.concat(available_capabilities(client.resolved_capabilities or {}), ', '),
      "raw: \t"..table.concat(vim.tbl_keys(client.server_capabilities or {}), ', '),
    }
  end

  for _, client in ipairs(buf_clients) do
     vim.list_extend(buf_lines, make_client_info(client))
     vim.list_extend(buf_lines, { "" })
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, buf_lines)
  vim.api.nvim_buf_set_option(bufnr,'modifiable',false)
  vim.api.nvim_buf_set_option(bufnr,'filetype','lspcapabilities')
  local configs_pattern = [[\%(]] .. table.concat(buf_client_names, [[\|]]) .. [[\)]]
  vim.cmd([[syntax match Title /\%(Client\):.*\zs]] .. configs_pattern .. '/')
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<esc>', '<cmd>bd<CR>', { noremap = true})
  vim.lsp.util.close_preview_autocmd({"BufHidden", "BufLeave"}, win_id)
end;
