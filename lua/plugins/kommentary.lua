local kommentary_config = require('kommentary.config')

local M = {}

function M.setup()
  kommentary_config.configure_language('default', {
    single_line_comment_string  = 'auto',
    prefer_single_line_comments = true,
    multi_line_comment_strings  = false,
  })
  kommentary_config.configure_language('typescriptreact', {
    single_line_comment_string  = 'auto',
    multi_line_comment_strings  = 'auto',
    hook_function = function()
      require('ts_context_commentstring.internal').update_commentstring()
    end
  })
  kommentary_config.configure_language('javascriptreact', {
    single_line_comment_string  = 'auto',
    multi_line_comment_strings  = 'auto',
    hook_function = function()
      require('ts_context_commentstring.internal').update_commentstring()
    end
  })
  kommentary_config.configure_language('vue', {
    single_line_comment_string  = 'auto',
    prefer_single_line_comments = true,
  })
  kommentary_config.configure_language('css', {
    single_line_comment_string  = 'auto',
    prefer_single_line_comments = true,
  })
end

return M
