local icons = EcoVim.icons

-- Created with figlet
vim.g.dashboard_custom_header = {
" ████████                           ██            ",
"░██░░░░░                           ░░             ",
"░██        █████   ██████  ██    ██ ██ ██████████ ",
"░███████  ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██",
"░██░░░░  ░██  ░░ ░██   ░██░░██ ░██ ░██ ░██ ░██ ░██",
"░██      ░██   ██░██   ░██ ░░████  ░██ ░██ ░██ ░██",
"░████████░░█████ ░░██████   ░░██   ░██ ███ ░██ ░██",
"░░░░░░░░  ░░░░░   ░░░░░░     ░░    ░░ ░░░  ░░  ░░ "
}

vim.g.dashboard_session_directory = '~/.config/nvim/sessions'
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_section = {
  a = {description = {icons.fileNoBg ..     'Find File          '}, command = 'Telescope find_files hidden=true'},
  b = {description = {icons.t ..            'Find Word          '}, command = 'Telescope live_grep'},
  c = {description = {icons.fileCopy ..     'Recents            '}, command = 'Telescope oldfiles hidden=true'},
  d = {description = {icons.timer ..        'Load Last Session  '}, command = 'SessionLoad'},
  e = {description = {icons.container ..    'Sync Plugins       '}, command = 'PackerSync'},
  f = {description = {icons.container ..    'Install Plugins    '}, command = 'PackerInstall'},
  g = {description = {icons.vim ..          'Settings           '}, command = 'edit $MYVIMRC'},
  h = {description = {icons.container ..    'Exit               '}, command = 'exit'},
}
