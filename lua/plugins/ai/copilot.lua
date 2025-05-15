return {
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cond = EcoVim.plugins.ai.copilot.enabled,
  --   lazy = false,
  --   cmd = "Copilot",
  --   event = "VeryLazy",
  --   opts = {
  --     panel = { enabled = false, auto_refresh = true },
  --     suggestion = {
  --       enabled = false,
  --       auto_trigger = true,
  --       keymap = {
  --         accept = "<TAB>",
  --         accept_word = "<C-w>",
  --         accept_line = "<C-l>",
  --         next = "<C-j>",
  --         prev = "<C-k>",
  --         dismiss = "<ESC>",
  --       },
  --     },
  --   },
  -- },
  {
    "copilotlsp-nvim/copilot-lsp",
    init = function()
      vim.g.copilot_nes_debounce = 300
      vim.lsp.enable("copilot_ls")
      vim.keymap.set("n", "<tab>", function()
        -- Try to jump to the start of the suggestion edit.
        -- If already at the start, then apply the pending suggestion and jump to the end of the edit.
        local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
            or (
              require("copilot-lsp.nes").apply_pending_nes() and require("copilot-lsp.nes").walk_cursor_end_edit()
            )
      end)
    end,
  }
}
