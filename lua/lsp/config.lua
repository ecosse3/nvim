-- Diagnostic config

vim.diagnostic.config({
  float = {
    format = function(diagnostic)
      if not diagnostic.source or not diagnostic.user_data.lsp.code then
        return string.format('%s', diagnostic.message)
      end

      if diagnostic.source == 'eslint' then
        return string.format('%s [%s]', diagnostic.message, diagnostic.user_data.lsp.code)
      end

      return string.format('%s [%s]', diagnostic.message, diagnostic.source)
    end
  },
  severity_sort = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  virtual_text = true,
})

-- UI

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

for _,lsp in ipairs(EcoVim.lsp) do
  require('lsp.servers.' .. lsp)
end
