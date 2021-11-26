local M = {}

-- Auto-install

local lsp_installer_servers = require'nvim-lsp-installer.servers'

local ok, bashls = lsp_installer_servers.get_server("bashls")
if ok then
    if not bashls:is_installed() then
        bashls:install()
    end
end

-- Settings

M.settings = {}

return M
