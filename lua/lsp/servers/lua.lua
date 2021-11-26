local M = {}

-- Auto-install
local lsp_installer_servers = require'nvim-lsp-installer.servers'

local ok, lua = lsp_installer_servers.get_server("sumneko_lua")
if ok then
    if not lua:is_installed() then
        lua:install()
    end
end

-- Settings

M.settings = {
  Lua = {
    diagnostics = {
      globals = {'vim'}
    }
  }
}

return M
