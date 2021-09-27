local icons = EcoVim.icons

vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_section = {
  a = {description = {icons.fileNoBg .. 'Find File          '}, command = 'Telescope find_files hidden=true'},
  b = {description = {icons.fileCopy .. 'Recently Used Files'}, command = 'Telescope oldfiles hidden=true'},
  c = {description = {icons.timer .. 'Load Last Session  '}, command = 'SessionLoad'},
  d = {description = {icons.t .. 'Find Word          '}, command = 'Telescope live_grep'},
  e = {description = {icons.container .. 'Packer Sync        '}, command = 'PackerSync'},
  f = {description = {icons.container .. 'Packer Install     '}, command = 'PackerInstall'}
  -- e = {description = {icons.ribbonNoBg .. 'Marks              '}, command = 'Telescope marks'}
}
