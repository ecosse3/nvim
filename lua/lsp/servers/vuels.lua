local M = {}

local on_attach = function(client, bufnr)
  client.resolved_capabilities.document_formatting = false
end

M.filetypes = {
  "vue",
}

M.init_options = {
  config = {
    css = {},
    emmet = {},
    html = {
      suggest = {},
    },
    javascript = {
      format = {},
    },
    stylusSupremacy = {},
    typescript = {
      format = {},
    },
    vetur = {
      completion = {
        autoImport = true,
        tagCasing = "kebab",
        useScaffoldSnippets = false,
      },
      format = {
        defaultFormatter = {
          html = "none",
          js = "none",
          ts = "none",
        },
        defaultFormatterOptions = {},
        scriptInitialIndent = false,
        styleInitialIndent = false,
      },
      useWorkspaceDependencies = false,
      validation = {
        script = true,
        style = true,
        template = true,
        templateProps = true,
        interpolation = true,
      },
      experimental = {
        templateInterpolationService = true,
      },
    },
  },
}

M.on_attach = on_attach

return M
