local M = {}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}
capabilities.textDocument.codeAction = {
  dynamicRegistration = false,
  codeActionLiteralSupport = {
    codeActionKind = {
      valueSet = {
        "",
        "quickfix",
        "refactor",
        "refactor.extract",
        "refactor.inline",
        "refactor.rewrite",
        "source",
        "source.organizeImports",
      },
    },
  },
}
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

local on_attach = function(client, bufnr)
  -- Modifying a server's capabilities is not recommended and is no longer
  -- necessary thanks to the `vim.lsp.buf.format` API introduced in Neovim
  -- 0.8. Users with Neovim 0.7 needs to uncomment below lines to make tsserver formatting work (or keep using eslint).

  -- client.server_capabilities.documentFormattingProvider = false
  -- client.server_capabilities.documentRangeFormattingProvider = false

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  require("lsp-inlayhints").on_attach(client, bufnr)
end

local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  -- Depending on typescript version either uri or targetUri is returned
  if value.uri then
    return string.match(value.uri, '%.d.ts') == nil
  elseif value.targetUri then
    return string.match(value.targetUri, '%.d.ts') == nil
  end
end

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = EcoVim.ui.float.border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = EcoVim.ui.float.border }),
  ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = EcoVim.lsp.virtual_text }),
  ['textDocument/definition'] = function(err, result, method, ...)
    if vim.tbl_islist(result) and #result > 1 then
      local filtered_result = filter(result, filterReactDTS)
      return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
    end

    vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
  end
}

local settings = {
  typescript = {
    inlayHints = {
      includeInlayParameterNameHints = 'all',
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = false,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = false,
      includeInlayEnumMemberValueHints = true,
    }
  },
  javascript = {
    inlayHints = {
      includeInlayParameterNameHints = 'all',
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = false,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = false,
      includeInlayEnumMemberValueHints = true,
    }
  }
}

M.capabilities = capabilities;
M.on_attach = on_attach;
M.handlers = handlers;
M.settings = settings;

return M
