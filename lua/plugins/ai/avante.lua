return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    enabled = EcoVim.plugins.ai.avante.enabled or true,
    lazy = false,
    version = false,
    opts = {
      provider = "copilot",
      mode = "agentic", -- The default mode for interaction. "agentic" uses tools to automatically generate code, "legacy" uses the old planning method to generate code.
      auto_suggestions_provider = "copilot",
      behaviour = {
        auto_apply_diff_after_generation = false,
        auto_focus_sidebar = true,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_suggestions = false,
        enable_cursor_planning_mode = true,
        jump_result_buffer_on_finish = false,
        minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
        support_paste_from_clipboard = true,
      },
      hints = { enabled = true },
      copilot = {
        model = "claude-3.7-sonnet",
        max_tokens = 120000,
        disable_tools = true, -- disable tools!
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
}
