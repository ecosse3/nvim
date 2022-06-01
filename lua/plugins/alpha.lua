local present, alpha = pcall(require, "alpha")
if not present then
  return
end

local dashboard = require("alpha.themes.dashboard")
local icons = require("icons")

local header = {
" ████████                           ██            ",
"░██░░░░░                           ░░             ",
"░██        █████   ██████  ██    ██ ██ ██████████ ",
"░███████  ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██",
"░██░░░░  ░██  ░░ ░██   ░██░░██ ░██ ░██ ░██ ░██ ░██",
"░██      ░██   ██░██   ░██ ░░████  ░██ ░██ ░██ ░██",
"░████████░░█████ ░░██████   ░░██   ░██ ███ ░██ ░██",
"░░░░░░░░  ░░░░░   ░░░░░░     ░░    ░░ ░░░  ░░  ░░ "
}

local utils = require "utils"

local footer = {
  type = "text",
  val = utils.align_center({ width = 0 }, {
    "",
    "lunarvim.org",
  }, 0.5),
  opts = {
    position = "center",
    hl = "Number",
  },
}

dashboard.section.footer = footer;

dashboard.section.header.type = "text";
dashboard.section.header.val = header;
dashboard.section.header.opts = {
  position = "center",
  hl = "EcovimHeader",
}

dashboard.section.buttons.val = {
  dashboard.button("<C-P>",   icons.fileNoBg .. "Find File", "<cmd>lua require('plugins.telescope').project_files()<CR>"),
  dashboard.button("<S-P>",   icons.t .. "Find Word", "<cmd>lua require('plugins.telescope.pickers.multi-rg')()<CR>"),
  dashboard.button("SPC s h", icons.fileCopy .. "Recents", "<cmd>Telescope oldfiles hidden=true<CR>"),
  dashboard.button("SPC / l", icons.timer .. "Load Last Session", "<cmd>SessionManager load_last_session<CR>"),
  dashboard.button("SPC / s", icons.container .. "Sync Plugins", "<cmd>PackerSync<CR>"),
  dashboard.button("SPC / i", icons.container .. "Install Plugins", "<cmd>PackerInstall<CR>"),
  dashboard.button("SPC / c", icons.cog .. "Settings", "<cmd>e $MYVIMRC<CR>"),
  dashboard.button("-",       icons.arrowReturn .. "Exit", "<cmd>exit<CR>"),
}

alpha.setup(dashboard.config)
