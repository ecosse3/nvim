local M = {}

-- Auto-install

local lsp_installer_servers = require'nvim-lsp-installer.servers'

local ok, jsonls = lsp_installer_servers.get_server("jsonls")
if ok then
    if not jsonls:is_installed() then
        jsonls:install()
    end
end

-- Settings

M.settings = {
  json = {
    schemas = {
      {
        fileMatch = {"package.json"},
        url = "https://json.schemastore.org/package.json"
      },
      {
        fileMatch = {"tsconfig*.json"},
        url = "https://json.schemastore.org/tsconfig.json"
      },
      {
        fileMatch = {".prettierrc", ".prettierrc.json", "prettier.config.json"},
        url = "https://json.schemastore.org/prettierrc.json"
      },
      {
        fileMatch = {".eslintrc", ".eslintrc.json"},
        url = "https://json.schemastore.org/eslintrc.json"
      },
      {
        fileMatch = {".babelrc", ".babelrc.json", "babel.config.json"},
        url = "https://json.schemastore.org/babelrc.json"
      },
      {
        fileMatch = {"lerna.json"},
        url = "https://json.schemastore.org/lerna.json"
      },
      {
        fileMatch = {"now.json", "vercel.json"},
        url = "https://json.schemastore.org/now.json"
      },
      {
        fileMatch = {"ecosystem.json"},
        url = "https://json.schemastore.org/pm2-ecosystem.json"
      },
    }
  }
}

return M
