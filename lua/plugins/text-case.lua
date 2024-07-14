return {
  {
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    -- Author's Note: If default keymappings fail to register (possible config issue in my local setup),
    -- verify lazy loading functionality. On failure, disable lazy load and report issue
    -- lazy = false,
    config = function()
      require("textcase").setup(
        {
          -- Set `default_keymappings_enabled` to false if you don't want automatic keymappings to be registered.
          default_keymappings_enabled = true,
          -- `prefix` is only considered if `default_keymappings_enabled` is true. It configures the prefix
          -- of the keymappings, e.g. `guu ` executes the `current_word` method with `to_upper_case`
          -- and `guou` executes the `operator` method with `to_upper_case`.
          prefix = "gu",
          -- If `substitude_command_name` is not nil, an additional command with the passed in name
          -- will be created that does the same thing as "Subs" does.
          substitude_command_name = nil,
          -- By default, all methods are enabled. If you set this option with some methods omitted,
          -- these methods will not be registered in the default keymappings. The methods will still
          -- be accessible when calling the exact lua function e.g.:
          -- "<CMD>lua require('textcase').current_word('to_snake_case')<CR>"
          enabled_methods = {
            "to_upper_case",
            "to_lower_case",
            "to_camel_case",
            "to_snake_case",
            -- "to_dash_case",
            "to_title_dash_case",
            "to_constant_case",
            "to_dot_case",
            "to_phrase_case",
            "to_pascal_case",
            "to_title_case",
            "to_path_case",
            "to_upper_phrase_case",
            "to_lower_phrase_case",
          },
        }
      )
      require("plugins.telescope").load_extension("textcase")
      vim.api.nvim_set_keymap('n', 'gu.', '<cmd>TextCaseOpenTelescope<CR>', { desc = "Telescope" })
      vim.api.nvim_set_keymap('v', 'gu.', "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
    end,
    cmd = { "TextCaseOpenTelescope", "Subs" },
    keys = { "gu" }
  },
}
