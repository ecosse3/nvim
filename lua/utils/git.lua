local utils = require('utils')

local M = {}

local function process_abbrev_head(gitdir, head_str, path)
  if not gitdir then
    return head_str
  end

  if head_str == "HEAD" then
    return vim.fn.trim(M.run_git_cmd("cd " .. path .. " && git --no-pager rev-parse --short HEAD"))
  end

  return head_str
end

function M.run_git_cmd(cmd)
  local cmd_result = vim.fn.system(cmd)
  if cmd_result == nil or utils.starts_with(cmd_result, "fatal:") then
    return nil
  end

  return cmd_result
end

function M.get_git_repo()
  local gsd = vim.b.gitsigns_status_dict
  if gsd and gsd.root and #gsd.root > 0 then
    return gsd.root
  end

  local git_root, _ = M.get_repo_info()
  return git_root
end

function M.get_current_branch_name()
  local gsd = vim.b.gitsigns_status_dict
  if gsd and gsd.head and #gsd.head > 0 then
    return gsd.head
  end

  local _, abbrev_head = M.get_repo_info()
  return abbrev_head
end

function M.get_repo_info()
  local cwd = vim.fn.expand "%:p:h"
  local data = vim.fn.trim(
    M.run_git_cmd("cd " .. cwd .. " && git --no-pager rev-parse --show-toplevel --absolute-git-dir --abbrev-ref HEAD")
  )
  local results = utils.split(data, "\n")

  local git_root = results[1]
  local abbrev_head = process_abbrev_head(results[2], results[3], cwd)

  return git_root, abbrev_head
end

return M
