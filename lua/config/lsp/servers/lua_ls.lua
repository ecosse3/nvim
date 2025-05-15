-- Configure lua_ls with Neovim 0.11 API
vim.lsp.config.lua_ls = {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim', 'bit', 'packer_plugins', 'EcoVim' },
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
      telemetry = {
        enable = false,
      },
      format = {
        enable = false,  -- Let other formatters handle this
      },
      completion = {
        callSnippet = "Replace",
      },
      hint = { enable = true },
    },
  },
  on_attach = function(client, bufnr)
    -- Disable formatting for lua_ls as it will be handled by other formatters like stylua
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}
