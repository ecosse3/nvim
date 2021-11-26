local M = {}

-- Auto-install

local lsp_installer_servers = require'nvim-lsp-installer.servers'

local ok, graphql = lsp_installer_servers.get_server("graphql")
if ok then
    if not graphql:is_installed() then
        graphql:install()
    end
end

-- Settings

M.settings = {}

return M
