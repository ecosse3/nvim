local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_nvim_lsp_ok then
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.colorProvider = { dynamicRegistration = false }
end

-- Settings

local on_attach = function (client, bufnr)
  if client.server_capabilities.colorProvider then
    require"lsp/utils/documentcolors".buf_attach(bufnr)
  end
end

local filetypes = { "html", "mdx", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte" }

local init_options = {
  userLanguages = {
    eelixir = "html-eex",
    eruby = "erb"
  }
}

local settings = {
  tailwindCSS = {
    lint = {
      cssConflict = "warning",
      invalidApply = "error",
      invalidConfigPath = "error",
      invalidScreen = "error",
      invalidTailwindDirective = "error",
      invalidVariant = "error",
      recommendedVariantOrder = "warning"
    },
    experimental = {
      classRegex = {
        "tw`([^`]*)",
        "tw=\"([^\"]*)",
        "tw={\"([^\"}]*)",
        "tw\\.\\w+`([^`]*)",
        "tw\\(.*?\\)`([^`]*)"
      }
    },
    validate = true
  }
}

M.on_attach = on_attach;
M.filetypes = filetypes;
M.capabilities = capabilities;
M.settings = settings;
M.init_options = init_options;


return M;
