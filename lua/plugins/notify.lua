local nvim_notify = require("notify")
nvim_notify.setup {
  -- Animation style
  stages = "fade_in_slide_out",
  -- Default timeout for notifications
  timeout = 1500,
  background_color = "#000000",
}

vim.notify = nvim_notify
