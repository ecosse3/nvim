" Leader Key Maps

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Hide wincmd mappings
let g:which_key_map['h'] = 'which_key_ignore'
let g:which_key_map['j'] = 'which_key_ignore'
let g:which_key_map['k'] = 'which_key_ignore'
let g:which_key_map['l'] = 'which_key_ignore'

" Hide airline tab mappings
let g:which_key_map['1'] = 'which_key_ignore'
let g:which_key_map['2'] = 'which_key_ignore'
let g:which_key_map['3'] = 'which_key_ignore'
let g:which_key_map['4'] = 'which_key_ignore'
let g:which_key_map['5'] = 'which_key_ignore'
let g:which_key_map['6'] = 'which_key_ignore'
let g:which_key_map['7'] = 'which_key_ignore'
let g:which_key_map['8'] = 'which_key_ignore'
let g:which_key_map['9'] = 'which_key_ignore'

" Single mappings
let g:which_key_map['/'] = [ ':e $MYVIMRC',         'open init' ]
let g:which_key_map['+'] = [ ':vertical resize +2', 'resize +2' ]
let g:which_key_map['-'] = [ ':vertical resize -2', 'resize -2' ]
let g:which_key_map['='] = [ '<C-W>=',              'balance windows' ]
let g:which_key_map['e'] = [ ':HopWord',            'hop' ]
let g:which_key_map['m'] = [ ':MaximizerToggle!',   'maximize' ]
let g:which_key_map['S'] = [ 'Startify',            'startify' ]
let g:which_key_map['u'] = [ ':UndotreeToggle',     'undo tree']
let g:which_key_map['v'] = [ '<C-W>v',              'split right']
let g:which_key_map['V'] = [ '<C-W>s',              'split below']
let g:which_key_map['z'] = [ 'Goyo',                'zen' ]

" Group mappings

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'c' : [':ColorizerToggle',       'colorizer'],
      \ 'l' : [':Bracey',                'start live server'],
      \ 'L' : [':BraceyStop',            'stop live server'],
      \ 'm' : [':MarkdownPreview',       'markdown preview'],
      \ 'M' : [':MarkdownPreviewStop',   'markdown preview stop'],
      \ 'n' : [':set nonumber!',         'line-numbers'],
      \ 'r' : [':set norelativenumber!', 'relative line nums'],
      \ 's' : [':let @/ = ""',           'remove search highlight'],
      \ 't' : [':FloatermNew',           'terminal'],
      \ 'w' : [':StripWhitespace',       'strip whitespace'],
      \ }

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'b' : [':BufferMovePrevious',       'Move back'],
      \ 'c' : [':BufferCloseAllButCurrent', 'Close but current'],
      \ 'd' : [':BufferOrderByDirectory',   'Order by directory'],
      \ 'f' : ['bfirst',                    'First buffer'],
      \ 'h' : ['Startify',                  'Home Buffer'],
      \ 'l' : [':BufferCloseBuffersLeft',   'Close Left'],
      \ 'r' : [':BufferCloseBuffersRight',  'Close Right'],
      \ 'n' : [':BufferMoveNext',           'Move next'],
      \ 'p' : [':BufferPick',               'Pick Buffer'],
      \ '?' : [':Telescope buffers',        'Search buffers'],
      \ }

" c is for LSP (because I've used to it from coc)
let g:which_key_map.c = {
      \ 'name' : '+lsp' ,
      \ 'd' : [':LspTroubleToggle',                   'diagnostics'],
      \ 'D' : [':Telescope lsp_document_diagnostics', 'diagnostics'],
      \ 'q' : [':Lspsaga code_action<CR>',            'quick fix'],
      \ 's' : [':Telescope symbols',                  'symbols'],
      \ 'v' : [':Vista!!',                            'vista'],
      \ }

let g:which_key_map['c']['a'] = 'code action'
let g:which_key_map['c']['l'] = 'line diagnostics'
let g:which_key_map['c']['r'] = 'rename'
let g:which_key_map['c']['f'] = 'format'

" d is for debug
let g:which_key_map.d = {
      \ 'name' : '+debug' ,
      \ 'b' : ['<Plug>VimspectorToggleBreakpoint',            'breakpoint'],
      \ 'B' : ['<Plug>VimspectorToggleConditionalBreakpoint', 'conditional breakpoint'],
      \ 'c' : ['<Plug>VimspectorRunToCursor',                 'run to cursor'],
      \ 'd' : ['<Plug>VimspectorContinue',                    'continue'],
      \ 'f' : ['<Plug>VimspectorAddFunctionBreakpoint',       'function breakpoint'],
      \ 'm' : [':MaximizerToggle',                            'maximize window'],
      \ 'o' : ['<Plug>VimspectorStepOver',                    'step over'],
      \ 'O' : ['<Plug>VimspectorStepOut',                     'step out'],
      \ 'i' : ['<Plug>VimspectorStepInto',                    'step into'],
      \ 'p' : ['<Plug>VimspectorPause',                       'pause'],
      \ 'r' : ['<Plug>VimspectorRestart',                     'restart'],
      \ 's' : ['<Plug>VimspectorStop',                        'stop'],
      \ }

let g:which_key_map['d']['?'] = 'add to watch'

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add %:p',                                  'add current'],
      \ 'A' : [':Git add .',                                    'add all'],
      \ 'b' : [':Git blame',                                    'blame'],
      \ 'B' : [':GBrowse',                                      'browse'],
      \ 'c' : [':GBranches',                                    'branches'],
      \ 'd' : [':Git diff',                                     'diff'],
      \ 'D' : [':Gdiffsplit',                                   'diff split'],
      \ 'f' : [':diffget //2',                                  'get left'],
      \ 'g' : [':FloatermNew --height=1.0 --width=1.0 lazygit', 'lazygit'],
      \ 'i' : [':Gist -b',                                      'post gist'],
      \ 'j' : [':diffget //3',                                  'get right'],
      \ 'm' : ['<Plug>(git-messenger)',                         'message'],
      \ 'P' : [':Git push',                                     'push'],
      \ 'p' : [':Git pull',                                     'pull'],
      \ 'v' : [':GV',                                           'view commits'],
      \ 'V' : [':GV!',                                          'view buffer commits'],
      \ }

let g:which_key_map['g']['s'] = 'status'

let g:which_key_map.g.h = {
      \ 'name' : '+hunk' ,
      \ }

let g:which_key_map['g']['h']['s'] = 'stage hunk'
let g:which_key_map['g']['h']['u'] = 'undo stage hunk'
let g:which_key_map['g']['h']['r'] = 'reset hunk'
let g:which_key_map['g']['h']['p'] = 'preview hunk'
let g:which_key_map['g']['h']['b'] = 'blame line'

let g:which_key_map.g.l = {
      \ 'name' : '+log',
      \ 'l' : [':Gclog --', 'classic log all'],
      \ }

let g:which_key_map['g']['l']['a'] = 'log all'
let g:which_key_map['g']['l']['c'] = 'log current file'

" i is for auto import
let g:which_key_map.i = {
      \ 'name' : '+import' ,
      \ }

let g:which_key_map['i']['f'] = 'import file'
let g:which_key_map['i']['F'] = 'import file list'
let g:which_key_map['i']['g'] = 'go to definition'
let g:which_key_map['i']['G'] = 'which_key_ignore'
let g:which_key_map['i']['p'] = 'prompt'
let g:which_key_map['i']['u'] = 'find usage'
let g:which_key_map['i']['s'] = 'sort'
let g:which_key_map['i']['c'] = 'fix'

" p is for project
let g:which_key_map.p = {
      \ 'name' : '+project' ,
      \ }
"
let g:which_key_map.p.r = {
      \ 'name' : '+refactor' ,
      \ }

let g:which_key_map['p']['w']      = 'find word'
let g:which_key_map['p']['f']      = 'find file'
let g:which_key_map['p']['r']['w'] = 'refactor word'

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search',
      \ '/' : [':History/',                  'history'],
      \ ';' : [':Commands',                  'commands'],
      \ 'a' : [':Ag',                        'text Ag'],
      \ 'b' : [':BLines',                    'current buffer'],
      \ 'B' : [':Telescope buffers',         'open buffers'],
      \ 'c' : [':Commits',                   'commits'],
      \ 'C' : [':BCommits',                  'buffer commits'],
      \ 'f' : [':Files',                     'files'],
      \ 'g' : [':Telescope git_files',       'git files'],
      \ 'G' : [':GFiles?',                   'modified git files'],
      \ 'h' : [':Telescope oldfiles',        'file history'],
      \ 'H' : [':Telescope command_history', 'command history'],
      \ 'l' : [':Lines',                     'lines'] ,
      \ 'm' : [':Telescope marks',           'marks'] ,
      \ 'M' : [':Maps',                      'normal maps'] ,
      \ 'p' : [':Helptags',                  'help tags'] ,
      \ 'P' : [':Tags',                      'project tags'],
      \ 's' : [':Telescope colorscheme',     'color schemes'],
      \ 'T' : [':BTags',                     'buffer tags'],
      \ 'y' : [':Filetypes',                 'file types'],
      \ }

" t is for tablemode
let g:which_key_map.t = {
      \ 'name' : '+table_mode' ,
      \ }

let g:which_key_map['t']['m'] = 'toggle table mode'
let g:which_key_map['t']['t'] = 'tableize'


" Register which key map
call which_key#register('<Space>', "g:which_key_map")
