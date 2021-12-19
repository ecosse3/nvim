local M = {}

-- UI

local signs = { Error = " 🞮", Warn = " ▲", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- LSP settings (for overriding per client)
M.handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = EcoVim.ui.float.border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = EcoVim.ui.float.border}),
}
-- Load servers (They will be automatically installed after next "Sync plugins" launch)
-- Check installed servers by :LspInstallInfo

-- require('lsp.servers.bash')
-- require('lsp.servers.css')
-- require('lsp.servers.eslint')
-- require('lsp.servers.graphql')
-- require('lsp.servers.html')
-- require('lsp.servers.json')
-- require('lsp.servers.lua')
-- require('lsp.servers.tailwind')
-- require('lsp.servers.tsserver')

return M
