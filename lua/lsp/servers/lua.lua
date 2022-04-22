local M = {}

-- Auto-install

local status_ok, lsp_installer_servers = pcall(require, 'nvim-lsp-installer.servers')
if status_ok then
  local ok, lua = lsp_installer_servers.get_server("sumneko_lua")
  if ok then
    if not lua:is_installed() then
      lua:install()
    end
  end
end

-- Settings

M.settings = {
  Lua = {
    diagnostics = {
      globals = { 'vim', 'bit' }
    }
  }
}

return M
