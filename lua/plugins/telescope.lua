local icons     = EcoVim.icons

local git_icons = {
  added = icons.gitAdd,
  changed = icons.gitChange,
  copied = ">",
  deleted = icons.gitRemove,
  renamed = "➡",
  unmerged = "‡",
  untracked = "?",
}

return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require('telescope').load_extension('fzf')
      require("telescope").load_extension("git_worktree")
      local actions = require('telescope.actions')

      require('telescope').setup {
        defaults = {
          border            = true,
          hl_result_eol     = true,
          multi_icon        = '',
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
          },
          layout_config     = {
            vertical = {
              preview_cutoff = 120,
            },
            prompt_position = "top",
          },
          file_sorter       = require('telescope.sorters').get_fzy_sorter,
          prompt_prefix     = '  ',
          color_devicons    = true,
          git_icons         = git_icons,
          sorting_strategy  = "ascending",
          file_previewer    = require('telescope.previewers').vim_buffer_cat.new,
          grep_previewer    = require('telescope.previewers').vim_buffer_vimgrep.new,
          qflist_previewer  = require('telescope.previewers').vim_buffer_qflist.new,
          mappings          = {
            i = {
              ["<C-x>"] = false,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
              ["<C-s>"] = actions.cycle_previewers_next,
              ["<C-a>"] = actions.cycle_previewers_prev,
              ["<C-d>"] = actions.delete_buffer,
              -- ["<C-h>"] = "which_key",
              ["<ESC>"] = actions.close,
            },
            n = {
              ["<C-s>"] = actions.cycle_previewers_next,
              ["<C-a>"] = actions.cycle_previewers_prev,
            }
          }
        },
        extensions = {
          fzf = {
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      }
    end,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = "Telescope",
    keys = {
      -- { "<C-p>",       "<CMD>lua require('plugins.telescope.pickers').project_files({ horizontal = true })<CR>" },
      -- { "<S-p>",       "<CMD>lua require('plugins.telescope.multi-rg')()<CR>" },
      -- { "<Leader>pf",  "<CMD>lua require('plugins.telescope.pickers').project_files({ default_text = vim.fn.expand('<cword>'), initial_mode = 'normal' })<CR>" },
      -- { "<Leader>pw",  "<CMD>lua require('telescope.builtin').grep_string({ initial_mode = 'normal' })<CR>" },
      -- { "<Leader>sb",  "<CMD>lua require('plugins.telescope.pickers').buffer_search()<CR>",                                                                    { desc = "Buffer Search" } },
      -- { "<Leader>glA", "<cmd>lua require('plugins.telescope.pickers').my_git_commits()<CR>",                                                                   { desc = "commits (Telescope)" } },
      -- { "<Leader>glC", "<cmd>lua require('plugins.telescope.pickers').my_git_bcommits()<CR>",                                                                  { desc = "buffer commits (Telescope)" } },
    }
  }
}
