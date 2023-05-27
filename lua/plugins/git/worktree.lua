local present, worktree = pcall(require, "git-worktree")
if not present then
  return
end

local keymap = vim.keymap.set
local silent = { silent = true }
local utils = require('utils')

-- ╭──────────────────────────────────────────────────────────╮
-- │ Setup                                                    │
-- ╰──────────────────────────────────────────────────────────╯
worktree.setup({
    change_directory_command = "cd",  -- default: "cd",
    update_on_change = true,          -- default: true,
    update_on_change_command = "e .", -- default: "e .",
    clearjumps_on_change = true,      -- default: true,
    autopush = false,                 -- default: false,
})

-- ╭──────────────────────────────────────────────────────────╮
-- │ Keymappings                                              │
-- ╰──────────────────────────────────────────────────────────╯
-- <Enter> - switches to that worktree
-- <c-d> - deletes that worktree
-- <c-f> - toggles forcing of the next deletion
keymap("n", "<Leader>gww", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", silent)

-- First a telescope git branch window will appear.
-- Presing enter will choose the selected branch for the branch name.
-- If no branch is selected, then the prompt will be used as the branch name.

-- After the git branch window,
-- a prompt will be presented to enter the path name to write the worktree to.

-- As of now you can not specify the upstream in the telescope create workflow,
-- however if it finds a branch of the same name in the origin it will use it
keymap("n", "<Leader>gwc", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", silent)

-- ╭──────────────────────────────────────────────────────────╮
-- │ Hooks                                                    │
-- ╰──────────────────────────────────────────────────────────╯
-- op = Operations.Switch, Operations.Create, Operations.Delete
-- metadata = table of useful values (structure dependent on op)
--      Switch
--          path = path you switched to
--          prev_path = previous worktree path
--      Create
--          path = path where worktree created
--          branch = branch name
--          upstream = upstream remote name
--      Delete
--          path = path where worktree deleted

worktree.on_tree_change(function(op, metadata)
  if op == worktree.Operations.Switch then
    utils.log("Switched from " .. metadata.prev_path .. " to " .. metadata.path, "Git Worktree")
    utils.closeOtherBuffers()
    vim.cmd ('e')
  end
end)
