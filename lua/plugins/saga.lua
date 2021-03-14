local saga = require 'lspsaga'


saga.init_lsp_saga {
  code_action_icon = '',
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true,
  },
  code_action_keys = { quit = {'q', '<ESC>'}, exec = '<CR>' },
  border_style = 2,
}
