-- Setup global configuration. More on configuration below.
local cmp = require('cmp')
local lspkind = require('lspkind')
local tabnine = require('cmp_tabnine.config')

local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local press = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end
  },

  -- You must set mapping if you want.
  mapping = {
    ['<C-b>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
    ['<Tab>'] = function(fallback)
      if vim.fn.complete_info()["selected"] == -1 and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
        press("<C-R>=UltiSnips#ExpandSnippet()<CR>")
      elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        press("<ESC>:call UltiSnips#JumpForwards()<CR>")
      elseif cmp.visible() then
        cmp.select_next_item()
      elseif has_any_words_before() then
        press("<Tab>")
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
  },

  formatting = {
    --[[ format = function(entry, vim_item)
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
    end ]]
    format = lspkind.cmp_format({with_text = true, maxwidth = 50, menu = ({
      buffer      = EcoVim.icons.buffer,
      nvim_lsp    = EcoVim.icons.warningTriangle,
      nvim_lua    = EcoVim.icons.bomb,
      path        = EcoVim.icons.folderOpen2,
      spell       = EcoVim.icons.spell,
      cmp_tabnine = EcoVim.icons.light,
      treesitter  = EcoVim.icons.tree,
      zsh         = EcoVim.icons.terminal,
    })})
  },

  -- You should specify your *installed* sources.
  sources = {
    { name = 'buffer'      },
    { name = 'calc'        },
    { name = 'cmp_tabnine' },
    { name = 'nvim_lsp'    },
    { name = 'nvim_lua'    },
    { name = 'path'        },
    { name = 'spell'       },
    { name = 'ultisnips'   },
    { name = 'vsnip'       },
  },
}

tabnine:setup({
        max_lines                = 1000;
        max_num_results          = 3;
        sort                     = true;
        show_prediction_strength = true;
})
