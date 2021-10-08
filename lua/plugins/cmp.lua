-- Setup global configuration. More on configuration below.
local cmp = require('cmp')
local lspkind = require('lspkind')
local tabnine = require('cmp_tabnine.config')

local source_mapping = {
  buffer      = "[B]",
  nvim_lsp    = "[LSP]",
  cmp_tabnine = "[TN]",
}

cmp.setup {
  snippet = {
    expand = function(args)
      -- You must install `vim-vsnip` if you use the following as-is.
      vim.fn['vsnip#anonymous'](args.body)
    end
  },

  -- You must set mapping if you want.
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]

      if entry.source.name == 'cmp_tabnine' then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = menu .. ' ' .. entry.completion_item.data.detail
				end
				vim_item.kind = ''
			end

      vim_item.menu = menu
      return vim_item
    end
  },

  -- You should specify your *installed* sources.
  sources = {
    { name = 'nvim_lsp'    },
    { name = 'buffer'      },
    { name = 'path'        },
    { name = 'calc'        },
    { name = 'cmp_tabnine' },
    { name = 'nvim_lua'    },
    { name = 'vsnip'       },
  },
}

tabnine:setup({
        max_lines                = 1000;
        max_num_results          = 3;
        sort                     = true;
        show_prediction_strength = true;
})
