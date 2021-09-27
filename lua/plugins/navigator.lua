local lsp_config = require('lspconfig')
local efm_root_markers = require('lsp.efm')
local eslint = require('lsp.efm.eslint')
local prettier = require('lsp.efm.prettier')
local efm_log_dir = '/tmp/'
local efm_config = os.getenv('HOME') .. '/.config/nvim/lua/lsp/efm/config.yaml'

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

require'navigator'.setup({
  debug = false,
  default_mapping = true,
  code_action_prompt = {enable = true, sign = true, sign_priority = 40, virtual_text = false},
  keymaps = {
    {key = "gr", func = "references()"},
    {mode = "i", key = "<M-k>", func = "signature_help()"},
    {key = "<c-k>", func = "signature_help()"},
    {key = "g0", func = "document_symbol()"},
    {key = "gW", func = "workspace_symbol()"},
    {key = "<c-]>", func = "definition()"},
    {key = "gD", func = "definition()"},
    {key = "gp", func = "require('navigator.definition').definition_preview()"},
    {key = "gT", func = "require('navigator.treesitter').buf_ts()"},
    {key = "<Leader>cgT", func = "require('navigator.treesitter').bufs_ts()"},
    {key = "K", func = "hover({ popup_opts = { border = single }})"},
    {key = "<C-Space>", mode = "n", func = "code_action()"},
    {key = "<Space>ca", mode = "n", func = "code_action()"},
    {key = "<Space>cA", mode = "v", func = "range_code_action()"},
    {key = "<Leader>cr", func = "rename()"},
    {key = "<Space>cn", func = "require('navigator.rename').rename()"},
    {key = "<Leader>cgi", func = "incoming_calls()"},
    {key = "<Leader>cgo", func = "outgoing_calls()"},
    {key = "gi", func = "implementation()"},
    {key = "<Space>cD", func = "type_definition()"},
    {key = "gL", func = "diagnostic.show_line_diagnostics( { border = 'single' })"},
    {key = "gG", func = "require('navigator.diagnostics').show_diagnostic()"},
    {key = "]g", func = "diagnostic.goto_next({ border = 'single' })"},
    {key = "[g", func = "diagnostic.goto_prev({ border = 'single' })"},
    {key = "]r", func = "require('navigator.treesitter').goto_next_usage()"},
    {key = "[r", func = "require('navigator.treesitter').goto_previous_usage()"},
    {key = "<C-LeftMouse>", func = "definition()"},
    {key = "g<LeftMouse>", func = "implementation()"},
    {key = "<Leader>ck", func = "require('navigator.dochighlight').hi_symbol()"},
    {key = '<Space>cwa', func = 'add_workspace_folder()'},
    {key = '<Space>cwr', func = 'remove_workspace_folder()'},
    {key = '<Space>cF', func = 'formatting()', mode='n'},
    {key = '<Space>cF', func = 'range_formatting()', mode='v'},
    {key = '<Space>cwl', func = 'print(vim.inspect(vim.lsp.buf.list_workspace_folders()))'},
    {key = "<Space>cla", mode = "n", func = "require('navigator.codelens').run_action()"},
  },
  lspinstall = true,
  treesitter_analysis = true,
  lsp = {
    format_on_save = false,
    lsp = {
      tsserver = {
        on_attach = function(client, bufnr)
          client.resolved_capabilities.document_formatting = false
        end,
      },
      efm = {
        on_attach = function(client, bufnr)
          client.resolved_capabilities.document_formatting = true
        end,
        cmd = {
          "efm-langserver",
          "-c",
          efm_config,
          "-logfile",
          efm_log_dir .. "efm.log"
        },
        filetypes = vim.tbl_keys(languages),
        root_dir  = lsp_config.util.root_pattern(unpack(efm_root_markers)),
        init_options = {
          documentFormatting = true
        },
        settings = {
          rootMarkers = efm_root_markers,
          languages   = languages
        },
      },
    }
  }
})

vim.api.nvim_set_keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", { noremap = true, silent = true })
