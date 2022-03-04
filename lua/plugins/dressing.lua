require('dressing').setup({
  select = {
    -- Priority list of preferred vim.select implementations
    backend = { "telescope", "nui", "fzf", "builtin" },

    -- Options for nui Menu
    nui = {
      position = {
        row = 1,
        col = 0,
      },
      size = nil,
      relative = "cursor",
      border = {
        style = "rounded",
        highlight = "NightflyRed",
        text = {
          top_align = "right",
        },
      },
      max_width = 80,
      max_height = 40,
    },

    -- see :help dressing_get_config
    get_config = function(opts)
      if opts.kind == 'codeaction' then
        return {
          backend = 'nui',
          nui = {
            relative = 'cursor',
            max_width = 80,
          }
        }
      end
    end
  },
})
