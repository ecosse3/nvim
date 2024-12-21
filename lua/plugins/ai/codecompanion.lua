return {
  {
    "olimorris/codecompanion.nvim",
    enabled = EcoVim.plugins.ai.codecompanion.enabled or true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
    },
    keys = {
      { "<leader>ccl", "<cmd>CodeCompanion<CR>",     desc = "Inline" },
      { "<leader>ccc", "<cmd>CodeCompanionChat<CR>", desc = "Chat" },
    },
    opts = {
      opts = {
        log_level = "DEBUG",
      },
      display = {
        chat = {
          show_settings = true,
        }
      },
      strategies = {
        chat = {
          adapter = "copilot",
          keymaps = {
            completion = {
              modes = {
                i = "<C-x>"
              },
              index = 1,
              callback = "keymaps.completion",
              description = "Completion Menu",
            }
          },
        },
        slash_commands = {
          ["buffer"] = {
            callback = "strategies.chat.slash_commands.buffer",
            description = "Insert open buffers",
            opts = {
              contains_code = true,
              provider = "telescope", -- default|telescope|mini_pick|fzf_lua
            },
          },
          ["fetch"] = {
            callback = "strategies.chat.slash_commands.fetch",
            description = "Insert URL contents",
            opts = {
              adapter = "jina",
            },
          },
          ["file"] = {
            callback = "strategies.chat.slash_commands.file",
            description = "Insert a file",
            opts = {
              contains_code = true,
              max_lines = 1000,
              provider = "telescope", -- default|telescope|mini_pick|fzf_lua
            },
          },
          ["files"] = {
            callback = "strategies.chat.slash_commands.files",
            description = "Insert multiple files",
            opts = {
              contains_code = true,
              max_lines = 1000,
              provider = "telescope", -- default|telescope|mini_pick|fzf_lua
            },
          },
          ["help"] = {
            callback = "strategies.chat.slash_commands.help",
            description = "Insert content from help tags",
            opts = {
              contains_code = false,
              provider = "telescope", -- telescope|mini_pick|fzf_lua
            },
          },
          ["now"] = {
            callback = "strategies.chat.slash_commands.now",
            description = "Insert the current date and time",
            opts = {
              contains_code = false,
            },
          },
          ["symbols"] = {
            callback = "strategies.chat.slash_commands.symbols",
            description = "Insert symbols for a selected file",
            opts = {
              contains_code = true,
              provider = "telescope", -- default|telescope|mini_pick|fzf_lua
            },
          },
          ["terminal"] = {
            callback = "strategies.chat.slash_commands.terminal",
            description = "Insert terminal output",
            opts = {
              contains_code = false,
            },
          },
        },
        inline = {
          adapter = "copilot",
        },
        agent = {
          adapter = "copilot",
        },
      },
      adapters = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "claude-3.5-sonnet",
              },
            },
          })
        end,
      },

    }
  }
}
