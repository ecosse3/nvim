local M = {}

-- Auto-install
local lsp_installer_servers = require'nvim-lsp-installer.servers'

local ok, vue = lsp_installer_servers.get_server("vuels")
if ok then
    if not vue:is_installed() then
        vue:install()
    end
end

-- Settings

M.init_options = {
  config = {
    css = {},
    emmet = {},
    html = {
      suggest = {}
    },
    javascript = {
      format = {}
    },
    stylusSupremacy = {},
    typescript = {
      format = {}
    },
    vetur = {
      completion = {
        autoImport = true,
        tagCasing = "kebab",
        useScaffoldSnippets = false
      },
      format = {
        defaultFormatter = {
          js = "none",
          ts = "none"
        },
        defaultFormatterOptions = {},
        scriptInitialIndent = false,
        styleInitialIndent = false
      },
      useWorkspaceDependencies = false,
      validation = {
        script = true,
        style = true,
        template = true
      }
    }
  }
}

return M
