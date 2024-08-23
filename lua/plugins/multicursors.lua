return {
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'smoka7/hydra.nvim',
    },
    opts = {
      hint_config = {
        border = EcoVim.ui.float.border or "rounded",
        position = 'bottom',
        show_name = false,
      }
    },
    keys = {
      {
        '<LEADER>m',
        '<CMD>MCstart<CR>',
        desc = 'multicursor',
      },
      {
        '<LEADER>m',
        '<CMD>MCvisual<CR>',
        mode = "v",
        desc = 'multicursor',
      },
      {
        '<C-Down>',
        '<CMD>MCunderCursor<CR>',
        desc = 'multicursor down',
      },
    },
  },
}
