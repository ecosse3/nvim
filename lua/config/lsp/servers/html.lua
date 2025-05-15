-- Configure html with Neovim 0.11 API
vim.lsp.config.html = {
  filetypes = { "html", "templ" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    provideFormatter = true,
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
  end,
  settings = {
    html = {
      format = {
        indentInnerHtml = false,
        wrapLineLength = 120,
        wrapAttributes = "auto",
        templating = true,
        unformatted = nil,
      },
      validate = {
        scripts = true,
        styles = true,
      },
      smartIndentation = true,
      mirrorCursorOnMatchingTag = true,
      hover = {
        documentation = true,
        references = true,
      },
    },
  },
}