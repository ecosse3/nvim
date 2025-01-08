return {
  {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    branch = 'v0.6', --recommended as each new version will have breaking changes
    opts = {
      --Config goes here
    },
  },
  {
    'windwp/nvim-autopairs',
    enabled = true,
    event = "InsertEnter",
    config = function()
      local npairs = require('nvim-autopairs')
      npairs.setup()

      for _, i in ipairs(npairs.config.rules) do
        i.key_map = nil
      end
    end
  }
}
