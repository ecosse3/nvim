local lsp_installer_servers = require'nvim-lsp-installer.servers'

local ok, jsonls = lsp_installer_servers.get_server("jsonls")
if ok then
    if not jsonls:is_installed() then
        jsonls:install()
    end
end
