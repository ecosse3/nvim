pcall(require, 'impatient')

require('packer_commands')
require('globals')
require('config')
require('settings')
require('colorscheme')
require('keymappings')
require('autocmds')
require('functions')

require('lsp.config')
require('lsp.setup')
require('lsp.functions')

require('snippets.react')
