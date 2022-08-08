pcall(require, 'impatient')

require('globals')
require('internal.packer_commands')
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
