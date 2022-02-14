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

-- LSP settings (for overriding per client)
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
-- require('lsp.servers.vue2')
