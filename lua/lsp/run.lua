-- Setup installer & lsp configs

require("nvim-lsp-installer").setup {
  -- A list of servers to automatically install if they're not already installed
  ensure_installed = { "bashls", "cssls", "eslint", "graphql", "html", "jsonls", "sumneko_lua", "tailwindcss", "tsserver", "vetur", "vuels" },
  -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed
  automatic_installation = true,
}
local lspconfig = require("lspconfig")

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = EcoVim.ui.float.border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = EcoVim.ui.float.border }),
}

local function on_attach(client, bufnr)
  -- set up buffer keymaps, etc.
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_nvim_lsp_ok then
  capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
end


lspconfig.eslint.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require('lsp.servers.eslint').on_attach,
  settings = require('lsp.servers.eslint').settings,
}

lspconfig.jsonls.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require('lsp.servers.jsonls').settings,
}

lspconfig.sumneko_lua.setup {
  handlers = handlers,
  on_attach = on_attach,
  settings = require('lsp.servers.sumneko_lua').settings,
}

lspconfig.tailwindcss.setup {
  capabilities = require('lsp.servers.tsserver').capabilities,
  filetypes = require('lsp.servers.tailwindcss').filetypes,
  handlers = handlers,
  init_options = require('lsp.servers.tailwindcss').init_options,
  on_attach = require('lsp.servers.tailwindcss').on_attach,
  settings = require('lsp.servers.tailwindcss').settings,
}

lspconfig.tsserver.setup {
  capabilities = require('lsp.servers.tsserver').capabilities,
  handlers = handlers,
  on_attach = require('lsp.servers.tsserver').on_attach,
}

lspconfig.vuels.setup {
  filetypes = require('lsp.servers.vuels').filetypes,
  handlers = handlers,
  init_options = require('lsp.servers.vuels').init_options,
  on_attach = on_attach,
}


for _, server in ipairs { "bashls", "cssls", "graphql", "html", "volar" } do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
  }
end
