local path_present, Path = pcall(require, "plenary.path")
if not path_present then
  return
end

return {
  {
    "Shatur/neovim-session-manager",
    lazy = false,
    config = function()
      local config_group = vim.api.nvim_create_augroup('SessionManagerGroup', {})

      require('session_manager').setup {
        sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),             -- The directory where the session files will be saved.
        path_replacer = '__',                                                    -- The character to which the path separator will be replaced for session files.
        colon_replacer = '++',                                                   -- The character to which the colon symbol will be replaced for session files.
        autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
        autosave_last_session = true,                                            -- Automatically save last session on exit and on session switch.
        autosave_ignore_not_normal = true,                                       -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
        autosave_ignore_filetypes = {                                            -- All buffers of these file types will be closed before the session is saved.
          'gitcommit',
          'gitrebase',
        },
        autosave_only_in_session = true, -- Always autosaves session. If true, only autosaves after a session is active.
        max_path_length = 80,            -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
      }

      vim.api.nvim_create_autocmd({ 'User' }, {
        pattern = "SessionLoadPost",
        group = config_group,
        callback = function()
          Snacks.explorer.open()
          vim.notify('Session loaded!', 'info', { title = 'Session Manager' })
        end,
      })

      vim.api.nvim_create_autocmd({ 'User' }, {
        pattern = "SessionSavePost",
        group = config_group,
        callback = function()
          vim.notify('Session saved!', 'info', { title = 'Session Manager', bufid = 0 })
          Snacks.explorer.open()
        end,
      })
    end,
    keys = {
      { "<leader>psl", "<cmd>SessionManager load_session<CR>",         desc = "load session" },
      { "<leader>psL", "<cmd>SessionManager load_last_session<CR>",    desc = "load last session" },
      { "<leader>pss", "<cmd>SessionManager save_current_session<CR>", desc = "save session" },
      { "<leader>psm", "<cmd>SessionManager available_commands<CR>",   desc = "available commands" },
    }
  },
}
