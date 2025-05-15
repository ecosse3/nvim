-- Configure prismals with Neovim 0.11 API
vim.lsp.config.prismals = {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
  end,
  settings = {
    prisma = {
      -- Format settings
      format = {
        enabled = true,
      },
      -- Trace settings (for debugging the language server)
      trace = {
        server = "off",
      },
    },
  },
  root_dir = function(fname, on_dir)
    local util = require("lspconfig.util")
    local root_patterns = {
      "schema.prisma",
      "prisma/schema.prisma",
      "*/prisma/schema.prisma",
    }
    local root = util.root_pattern(unpack(root_patterns))(fname)
    if root then
      on_dir(root)
    else
      -- Fall back to directory with package.json
      local pkg_root = util.find_package_json_ancestor(fname)
      if pkg_root then
        on_dir(pkg_root)
      end
    end
  end,
  filetypes = { "prisma" },
}