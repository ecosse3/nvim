local function buf_option(...)
  vim.api.nvim_buf_set_option(bufnr, ...)
end

local function on_attach(client)
  buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

return on_attach
