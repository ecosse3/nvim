local previewers = require('telescope.previewers')
local builtin    = require('telescope.builtin')

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
  builtin.find_files(
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

M.buffer_search = function()
  builtin.buffers(
    require('telescope.themes').get_dropdown({
      sort_mru       = true,
      sort_lastused  = true,
      previewer      = false,
      color_devicons = true,
      winblend       = 4,
      layout_config  = {
        width = function(_, max_columns, _)
          return math.min(max_columns, 100)
        end,
        height = function(_, _, max_lines)
          return math.min(max_lines, 15)
        end,
      },
    }))
end

return M
