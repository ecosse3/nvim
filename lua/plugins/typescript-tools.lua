local baseDefinitionHandler = vim.lsp.handlers["textDocument/definition"]

local filter = require("lsp.utils.filter").filter
local filterReactDTS = require("lsp.utils.filterReactDTS").filterReactDTS

local mason_registry = require('mason-registry')
local tsserver_path = mason_registry.get_package('typescript-language-server'):get_install_path()

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    silent = true,
    border = EcoVim.ui.float.border,
  }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = EcoVim.ui.float.border }),
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = EcoVim.lsp.virtual_text }
  ),
  ["textDocument/definition"] = function(err, result, method, ...)
    P(result)
    if vim.tbl_islist(result) and #result > 1 then
      local filtered_result = filter(result, filterReactDTS)
      return baseDefinitionHandler(err, filtered_result, method, ...)
    end

    baseDefinitionHandler(err, result, method, ...)
  end,
}

require("typescript-tools").setup({
  on_attach = function(client, bufnr)
    if vim.fn.has("nvim-0.10") then
      -- Enable inlay hints
      vim.lsp.inlay_hint(bufnr, true)
    end
  end,
  handlers = handlers,
  settings = {
    separate_diagnostic_server = true,
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
      includeCompletionsForModuleExports = true,
      quotePreference = "auto",
    },
  },
})
