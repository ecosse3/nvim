local M = {}

local on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = true
  client.resolved_capabilities.document_formatting = true
  client.resolved_capabilities.goto_definition = false
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %m" },
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

M.on_attach = on_attach;

M.settings = {
  codeAction = {
    disableRuleComment = {
      enable = true,
      location = "separateLine"
    },
    showDocumentation = {
      enable = true
    }
  },
  codeActionOnSave = {
    enable = true,
    mode = "all"
  },
  format = true,
  nodePath = "",
  onIgnoredFiles = "off",
  packageManager = "npm",
  quiet = false,
  rulesCustomizations = {},
  run = "onType",
  useESLintClass = false,
  validate = "on",
  workingDirectory = {
    mode = "location"
  },
  languages = {
    javascript = { eslint },
    javascriptreact = { eslint },
    ["javascript.jsx"] = { eslint },
    typescript = { eslint },
    ["typescript.tsx"] = { eslint },
    typescriptreact = { eslint }
  }
}

M.filetypes = {
  "javascript",
  "javascriptreact",
  "javascript.jsx",
  "typescript",
  "typescript.tsx",
  "typescriptreact"
}
return M
