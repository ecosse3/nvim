local M = {}

-- Auto-install

local lsp_installer_servers = require'nvim-lsp-installer.servers'

local ok, cssls = lsp_installer_servers.get_server("cssls")
if ok then
    if not cssls:is_installed() then
        cssls:install()
    end
end

-- Settings

M.settings = {}

return M
