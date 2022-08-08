local utils = require('utils')
local git = require('utils.git')

local M = {}

local config = {
  keymaps = {
    quit_blame = "q",
    blame_commit = "<CR>"
  }
}

local blame_state = {
  file = "",
  temp_file = "",
  starting_win = "",
  relative_path = "",
  git_root = "",
}

local function blameLinechars()
  return vim.fn.strlen(vim.fn.getline ".")
end

local function create_blame_win()
  vim.api.nvim_command "topleft vnew"
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_get_current_buf()

  vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
  vim.api.nvim_buf_set_option(buf, "swapfile", false)
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(buf, "filetype", "GitBlame")
  vim.api.nvim_buf_set_option(buf, "buflisted", false)

  vim.api.nvim_win_set_option(win, "number", true)
  vim.api.nvim_win_set_option(win, "foldcolumn", "0")
  vim.api.nvim_win_set_option(win, "foldenable", false)
  vim.api.nvim_win_set_option(win, "foldenable", false)
  vim.api.nvim_win_set_option(win, "winfixwidth", true)
  vim.api.nvim_win_set_option(win, "signcolumn", "yes")
  vim.api.nvim_win_set_option(win, "wrap", false)

  return win, buf
end

local function blame_syntax()
  local seen = {}
  local hash_colors = {}
  for lnum = 1, vim.fn.line "$" do
    local orig_hash = vim.fn.matchstr(vim.fn.getline(lnum), [[^\^\=[*?]*\zs\x\{6\}]])
    local hash = orig_hash
    hash = vim.fn.substitute(hash, [[\(\x\)\x]], [[\=submatch(1).printf("%x", 15-str2nr(submatch(1),16))]], "g")
    hash = vim.fn.substitute(hash, [[\(\x\x\)]], [[\=printf("%02x", str2nr(submatch(1),16)*3/4+32)]], "g")
    if hash ~= "" and orig_hash ~= "000000" and seen[hash] == nil then
      seen[hash] = 1
      if vim.wo.t_Co == "256" then
        local colors = vim.fn.map(vim.fn.matchlist(orig_hash, [[\(\x\)\x\(\x\)\x\(\x\)\x]]), "str2nr(v:val,16)")
        local r = colors[2]
        local g = colors[3]
        local b = colors[4]
        local color = 16 + (r + 1) / 3 * 36 + (g + 1) / 3 * 6 + (b + 1) / 3
        if color == 16 then
          color = 235
        elseif color == 231 then
          color = 255
        end
        hash_colors[hash] = " ctermfg=" .. tostring(color)
      else
        hash_colors[hash] = ""
      end
      local pattern = vim.fn.substitute(orig_hash, [[^\(\x\)\x\(\x\)\x\(\x\)\x$]], [[\1\\x\2\\x\3\\x]], "") .. [[*\>]]
      vim.cmd("syn match GitNvimBlameHash" .. hash .. [[       "\%(^\^\=[*?]*\)\@<=]] .. pattern .. [[" skipwhite]])
    end

    for hash_value, cterm in pairs(hash_colors) do
      if cterm ~= nil or vim.fn.has "gui_running" or vim.fn.hash "termguicolors" and vim.wo.termguicolors then
        vim.cmd("hi GitNvimBlameHash" .. hash_value .. " guifg=#" .. hash_value .. cterm)
      else
        vim.cmd("hi link GitNvimBlameHash" .. hash_value .. " Identifier")
      end
    end
  end
end

local function on_blame_done(lines)
  local starting_win = vim.api.nvim_get_current_win()
  local current_top = vim.fn.line "w0" + vim.wo.scrolloff
  local current_pos = vim.fn.line "."

  -- Save the state
  blame_state.file = vim.api.nvim_buf_get_name(0)
  blame_state.starting_win = starting_win

  local blame_win, blame_buf = create_blame_win()

  vim.api.nvim_buf_set_lines(blame_buf, 0, -1, true, lines)
  vim.api.nvim_buf_set_option(blame_buf, "modifiable", false)
  vim.api.nvim_win_set_width(blame_win, blameLinechars() + 1)

  vim.cmd("execute " .. tostring(current_top))
  vim.cmd "normal! zt"
  vim.cmd("execute " .. tostring(current_pos))

  -- We should call cursorbind, scrollbind here to avoid unexpected behavior
  vim.api.nvim_win_set_option(blame_win, "cursorbind", true)
  vim.api.nvim_win_set_option(blame_win, "scrollbind", true)

  vim.api.nvim_win_set_option(starting_win, "scrollbind", true)
  vim.api.nvim_win_set_option(starting_win, "cursorbind", true)

  -- Keymaps
  local options = {
    noremap = true,
    silent = true,
    expr = false,
  }

  vim.api.nvim_buf_set_keymap(0, "n", config.keymaps.quit_blame, "<CMD>q<CR>", options)
  vim.api.nvim_buf_set_keymap(
    0,
    "n",
    config.keymaps.blame_commit,
    "<CMD>lua require('blame').blame_commit()<CR>",
    options
  )
  vim.api.nvim_command "autocmd BufWinLeave <buffer> lua require('blame').blame_quit()"

  blame_syntax()
end

local function on_blame_commit_done(commit_hash, lines)
  -- TODO: Find a better way to handle this case
  local idx = 1
  while idx <= #lines and not utils.starts_with(lines[idx], "diff") do
    idx = idx + 1
  end
  table.insert(lines, idx, "")

  local temp_file = vim.fn.tempname()
  blame_state.temp_file = temp_file
  vim.fn.writefile(lines, temp_file)

  -- Close blame window
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)

  vim.api.nvim_command("silent! e" .. temp_file)

  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_name(buf, commit_hash)
  vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
  vim.api.nvim_buf_set_option(buf, "bufhidden", "delete")
  vim.api.nvim_buf_set_option(buf, "filetype", "Git")
  vim.api.nvim_command "autocmd BufLeave <buffer> lua require('blame').blame_commit_quit()"

  vim.fn.search([[^diff .* b/\M]] .. vim.fn.escape(blame_state.relative_path, "\\") .. "$", "W")
end

function M.blame_commit_quit()
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_command(buf .. "bdelete")
  vim.fn.delete(blame_state.temp_file)
end

function M.blame_commit()
  local line = vim.fn.getline "."
  local commit = vim.fn.matchstr(line, [[^\^\=[?*]*\zs\x\+]])
  if string.match(commit, "^0+$") then
    utils.warnlog("Not Committed Yet", "Git")
    return
  end

  local commit_hash = git.run_git_cmd(
    "git -C " .. blame_state.git_root .. " --literal-pathspecs rev-parse --verify " .. commit .. " --"
  )
  if commit_hash == nil then
    utils.warnlog("Commit hash not found", "Git")
    return
  end

  commit_hash = string.gsub(commit_hash, "\n", "")
  local diff_cmd = "git -C "
    .. blame_state.git_root
    .. " --literal-pathspecs --no-pager show --no-color "
    .. commit_hash
    .. " -- "
    .. blame_state.file

  local lines = {}
  local function on_event(_, data, event)
    -- TODO: Handle error data
    if event == "stdout" or event == "stderr" then
      data = utils.handle_job_data(data)
      if not data then
        return
      end

      for i = 1, #data do
        if data[i] ~= "" then
          table.insert(lines, data[i])
        end
      end
    end

    if event == "exit" then
      on_blame_commit_done(commit_hash, lines)
    end
  end

  vim.fn.jobstart(diff_cmd, {
    on_stderr = on_event,
    on_stdout = on_event,
    on_exit = on_event,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

function M.blame_quit()
  vim.api.nvim_win_set_option(blame_state.starting_win, "scrollbind", false)
  vim.api.nvim_win_set_option(blame_state.starting_win, "cursorbind", false)
end

function M.open()
  local fpath = vim.api.nvim_buf_get_name(0)
  if fpath == "" or fpath == nil then
    return
  end

  local git_root = git.get_git_repo()
  if git_root == "" then
    return
  end
  blame_state.git_root = git_root
  blame_state.relative_path = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.")

  local blame_cmd = "git -C "
    .. git_root
    .. " --literal-pathspecs --no-pager -c blame.coloring=none -c blame.blankBoundary=false blame --show-number -- "
    .. fpath

  local lines = {}
  local has_error = false

  local function on_event(_, data, event)
    if event == "stdout" then
      data = utils.handle_job_data(data)
      if not data then
        return
      end

      for i = 1, #data do
        if data[i] ~= "" then
          local commit = vim.fn.matchstr(data[i], [[^\^\=[?*]*\zs\x\+]])
          local commit_info = data[i]:match "%((.-)%)"
          commit_info = string.match(commit_info, "(.-)%s(%S+)$")
          table.insert(lines, commit .. " " .. commit_info)
        end
      end
    elseif event == "stderr" then
      data = utils.handle_job_data(data)
      if not data then
        return
      end

      has_error = true
      local error_message = ""
      for _, line in ipairs(data) do
        error_message = error_message .. line
      end
      utils.warnlog("Failed to open git blame window: " .. error_message, "Git")
    elseif event == "exit" then
      if not has_error then
        on_blame_done(lines)
      end
    end
  end

  vim.fn.jobstart(blame_cmd, {
    on_stderr = on_event,
    on_stdout = on_event,
    on_exit = on_event,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

return M
