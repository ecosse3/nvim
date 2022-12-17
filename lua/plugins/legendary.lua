local present, legendary = pcall(require, "legendary")

local M = {}

function M.keymap(mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true,
    expr = false,
  }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  if present then
    legendary.keymap(mode, lhs, rhs, options)
  else
    pcall(vim.keymap.set, mode, lhs, rhs, options)
  end
end

function M.bind_function(...)
  if present then
    legendary.bind_function(...)
  end
end

function M.d(desc)
  return {
    desc = desc
  }
end

if not present then
  return M
end

legendary.setup({
  include_builtin = false,
  which_key = {
    auto_register = true,
  }
})

return M
