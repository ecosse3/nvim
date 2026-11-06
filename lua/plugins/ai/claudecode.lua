return {
  {
    "coder/claudecode.nvim",
    enabled = EcoVim.plugins.ai.claudecode.enabled,
    dependencies = { "folke/snacks.nvim" },
    opts = function()
      -- Double <Esc> inside the Claude terminal: leave terminal mode and jump back to the editor window.
      -- The Claude window stays open (use <leader>ii to jump back into it). A single <Esc> is still
      -- passed through to Claude Code (it uses Esc to interrupt/cancel).
      local esc_timer = vim.uv.new_timer()
      local function focus_editor()
        vim.cmd("stopinsert")
        local function is_editor(win)
          local cfg = vim.api.nvim_win_get_config(win)
          return cfg.relative == "" and vim.bo[vim.api.nvim_win_get_buf(win)].buftype == ""
        end
        -- Prefer the window we came from, otherwise the first normal window in the tab
        local prev = vim.fn.win_getid(vim.fn.winnr("#"))
        if prev ~= 0 and vim.api.nvim_win_is_valid(prev) and is_editor(prev) then
          return vim.api.nvim_set_current_win(prev)
        end
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
          if is_editor(win) then
            return vim.api.nvim_set_current_win(win)
          end
        end
      end

      return {
        -- terminal_cmd = "/path/to/claude", -- only if `claude` is not on $PATH
        terminal = {
          snacks_win_opts = {
            keys = {
              -- Overrides snacks' default "double escape to normal mode" binding
              term_normal = {
                "<esc>",
                function()
                  if esc_timer:is_active() then
                    esc_timer:stop()
                    vim.schedule(focus_editor)
                    return ""
                  end
                  esc_timer:start(200, 0, function() end)
                  return "<esc>"
                end,
                mode = "t",
                expr = true,
                desc = "Double Esc: back to editor",
              },
            },
          },
        },
      }
    end,
    -- Keep the cmd list so :ClaudeCode* commands exist before any key is pressed
    cmd = {
      "ClaudeCode",
      "ClaudeCodeFocus",
      "ClaudeCodeSelectModel",
      "ClaudeCodeAdd",
      "ClaudeCodeSend",
      "ClaudeCodeTreeAdd",
      "ClaudeCodeStatus",
      "ClaudeCodeStart",
      "ClaudeCodeStop",
      "ClaudeCodeOpen",
      "ClaudeCodeClose",
      "ClaudeCodeDiffAccept",
      "ClaudeCodeDiffDeny",
      "ClaudeCodeCloseAllDiffs",
    },
    -- Uses <leader>i* (AI) because <leader>a* is the "Actions" group (comment-box, toggles, markdown preview)
    keys = {
      -- Smart: opens Claude, focuses it if visible, hides it if you are already inside it
      { "<leader>ii", "<cmd>ClaudeCodeFocus<cr>", desc = "Go to / toggle Claude" },
      { "<leader>ic", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>if", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ir", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>iC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>im", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ib", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>is", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>is",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file to Claude",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker_list" },
      },
      { "<leader>ia", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>id", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
}
