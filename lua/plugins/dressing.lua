require('dressing').setup({
  input = {
    -- Set to false to disable the vim.ui.input implementation
    enabled = true,

    -- Default prompt string
    default_prompt = "Input:",

    -- Can be 'left', 'right', or 'center'
    prompt_align = "left",

    -- When true, <Esc> will close the modal
    insert_only = true,

    -- These are passed to nvim_open_win
    anchor = "SW",
    border = EcoVim.ui.float.border or "rounded",
    -- 'editor' and 'win' will default to being centered
    relative = "cursor",

    -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    prefer_width = 10,
    width = nil,
    -- min_width and max_width can be a list of mixed types.
    -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
    max_width = { 140, 0.9 },
    min_width = { 10, 0.1 },

    -- Window transparency (0-100)
    winblend = 0,
    -- Change default highlight groups (see :help winhl)
    winhighlight = "",

    override = function(conf)
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      return conf
    end,

    -- see :help dressing_get_config
    get_config = nil,
  },

  select = {
    -- Set to false to disable the vim.ui.select implementation
    enabled = true,

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
        style = EcoVim.ui.float.border or "rounded",
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
            min_height = 2,
          }
        }
      end
    end
  },
})
