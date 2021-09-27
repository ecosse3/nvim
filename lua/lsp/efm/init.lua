local lsp_config = require('lspconfig')
local eslint = require('lsp.efm.eslint')
local prettier = require('lsp.efm.prettier')

local efm_config = os.getenv('HOME') .. '/.config/nvim/lua/lsp/efm/config.yaml'
local efm_log_dir = '/tmp/'
local efm_root_markers = { 'package.json', '.git/', '.zshrc' }

local languages = {
  yaml               = { prettier },
  json               = { prettier },
  markdown           = { prettier },
  javascript         = { eslint, prettier },
  javascriptreact    = { eslint, prettier },
  ["javascript.jsx"] = { eslint, prettier },
  typescript         = { eslint, prettier },
  typescriptreact    = { eslint, prettier },
  ["typescript.tsx"] = { eslint, prettier },
  css                = { prettier },
  scss               = { prettier },
  sass               = { prettier },
  less               = { prettier },
  graphql            = { prettier },
  vue                = { prettier },
  html               = { prettier }
}

local rustywind = {
  -- yarn global add rustywind
  formatCommand = "rustywind --stdin",
  formatStdin = true
}

-- local tailwind_fts = require"lspinstall/servers".tailwindcss.default_config.filetypes
-- for _, filetype in ipairs(tailwind_fts) do
--   if languages[filetype] then
--     table.insert(languages[filetype], 1, rustywind)
--   else
--     languages[filetype] = { rustywind }
--   end
-- end

lsp_config.efm.setup({
  cmd = {
    "efm-langserver",
    "-c",
    efm_config,
    "-logfile",
    efm_log_dir .. "efm.log"
  },
  filetypes = vim.tbl_keys(languages),
  on_attach = function(bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  end,
  root_dir  = lsp_config.util.root_pattern(unpack(efm_root_markers)),
  init_options = {
    documentFormatting = true
  },
  settings = {
    rootMarkers = efm_root_markers,
    languages = languages
  }
})

return {
  efm_log_dir,
  efm_root_markers,
  languages
}
