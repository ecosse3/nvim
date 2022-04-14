-- Requires
local lspkind = require('lspkind')
local tabnine = require('cmp_tabnine.config')

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

-- Utils
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- Setup
local source_mapping = {
  buffer      = EcoVim.icons.buffer .. '[BUF]',
  calc        = EcoVim.icons.calculator,
  cmp_tabnine = EcoVim.icons.light,
  luasnip     = EcoVim.icons.snippet,
  npm         = EcoVim.icons.terminal .. '[NPM]',
  nvim_lsp    = EcoVim.icons.paragraph .. '[LSP]',
  nvim_lua    = EcoVim.icons.bomb,
  path        = EcoVim.icons.folderOpen2,
  treesitter  = EcoVim.icons.tree,
  zsh         = EcoVim.icons.terminal .. '[ZSH]',
}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },

  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-2), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(2), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ['<CR>'] = cmp.mapping.confirm({ select = EcoVim.plugins.completion.select_first_on_enter }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.symbolic(vim_item.kind, { with_text = true })
      local menu = source_mapping[entry.source.name]
      local maxwidth = 50

      if entry.source.name == 'cmp_tabnine' then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = menu .. '[' .. entry.completion_item.data.detail .. ']'
				end
			end

      vim_item.menu = menu
      vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)

      return vim_item
    end
  },

  -- You should specify your *installed* sources.
  sources = {
    { name = 'npm', priority = 9                             },
    { name = 'nvim_lsp', priority = 8                        },
    { name = 'cmp_tabnine', priority = 8, max_item_count = 3 },
    { name = 'luasnip', priority = 7                         },
    { name = 'buffer', priority = 7, keyword_length = 5      },
    { name = 'nvim_lua', priority = 5                        },
    { name = 'path',priority = 4                             },
    { name = 'calc', priority = 3                            },
  },

  sorting = {
    priority_weight = 1.0,
    comparators = {
      cmp.config.compare.locality,
      cmp.config.compare.recently_used,
      cmp.config.compare.score,
      cmp.config.compare.offset,
      cmp.config.compare.order,
    },
  },

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  window = {
    completion = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      scrollbar = "║",
      autocomplete = {
        require("cmp.types").cmp.TriggerEvent.InsertEnter,
        require("cmp.types").cmp.TriggerEvent.TextChanged,
      },
    },
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      scrollbar = "║",
    },
  },

  experimental = {
    native_menu = false,
    ghost_text = true,
  }
}

tabnine:setup({
  max_lines                = 1000;
  max_num_results          = 3;
  sort                     = true;
  show_prediction_strength = true;
  run_on_every_keystroke   = true;
  snipper_placeholder      = '..';
  ignored_file_types       = {};
})
