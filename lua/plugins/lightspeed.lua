-- ╭──────────────────────────────────────────────────────────╮
-- │ Setup                                                    │
-- ╰──────────────────────────────────────────────────────────╯
require'lightspeed'.setup {}

local silent = { silent = true }

vim.keymap.del("n", "S", silent)
vim.keymap.del("n", "s", silent)
vim.keymap.set("n", "s", "<Plug>Lightspeed_omni_s", silent)
