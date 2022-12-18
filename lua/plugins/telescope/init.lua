local actions      = require('telescope.actions')
local previewers   = require('telescope.previewers')
local builtin      = require('telescope.builtin')
local icons        = EcoVim.icons;
local action_state = require("telescope.actions.state")
local lga_actions  = require('telescope-live-grep-args.actions')

require('telescope').load_extension('fzf')
require('telescope').load_extension('live_grep_args')
require("telescope").load_extension("git_worktree")


local git_icons = {
  added = icons.gitAdd,
  changed = icons.gitChange,
  copied = ">",
  deleted = icons.gitRemove,
  renamed = "➡",
  unmerged = "‡",
  untracked = "?",
}

require('telescope').setup {
  defaults = {
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
      horizontal = {
        preview_cutoff = 120,
      },
      prompt_position = "top",
    },
    layout_strategy   = "flex",
    file_sorter       = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix     = '  ',
    color_devicons    = true,
    initial_mode      = "insert",
    git_icons         = git_icons,

    sorting_strategy = "ascending",

    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
        ["<C-h>"] = "which_key",
        ["<ESC>"] = actions.close,
        ["<C-c>"] = function(prompt_bufnr)
          local picker = action_state.get_current_picker(prompt_bufnr)
          picker:set_prompt("")
        end
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
    },
    live_grep_args = {
      disable_coordinates = true,
      auto_quoting = true, -- enable/disable auto-quoting
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-r>"] = function(prompt_bufnr)
            local picker = action_state.get_current_picker(prompt_bufnr)
            local prompt = picker:_get_prompt()
            picker:set_prompt("--no-fixed-strings " .. prompt)
          end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    }
  }
}

-- Implement delta as previewer for diffs

local M = {}

local delta_bcommits = previewers.new_termopen_previewer {
  get_command = function(entry)
    return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!', '--',
      entry.current_file }
  end
}

local delta = previewers.new_termopen_previewer {
  get_command = function(entry)
    return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!' }
  end
}

M.my_git_commits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_commits(opts)
end

M.my_git_bcommits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta_bcommits,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_bcommits(opts)
end

-- Custom pickers

M.edit_neovim = function()
  builtin.git_files(
    require('telescope.themes').get_dropdown({
      color_devicons   = true,
      cwd              = "~/.config/nvim",
      previewer        = false,
      prompt_title     = "Ecovim Dotfiles",
      sorting_strategy = "ascending",
      winblend         = 4,
      layout_config    = {
        horizontal = {
          mirror = false,
        },
        vertical = {
          mirror = false,
        },
        prompt_position = "top",
      },
    }))
end

M.project_files = function(opts)
  opts = opts or {} -- define here if you want to define something
  local ok = pcall(require "telescope.builtin".git_files, opts)
  if not ok then require "telescope.builtin".find_files(opts) end
end

M.command_history = function()
  builtin.command_history(
    require('telescope.themes').get_dropdown({
      color_devicons = true,
      winblend       = 4,
      layout_config  = {
        width = function(_, max_columns, _)
          return math.min(max_columns, 150)
        end,

        height = function(_, _, max_lines)
          return math.min(max_lines, 15)
        end,
      },
    }))
end

return M
