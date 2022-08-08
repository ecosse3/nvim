pcall(require, 'impatient')

require('internal.packer_commands')
require('utils.globals')
require('config')
require('settings')
require('colorscheme')
require('keymappings')
require('autocmds')
require('functions')
require('internal.cursorword')

require('lsp.config')
require('lsp.setup')
require('lsp.functions')

require('snippets.react')
