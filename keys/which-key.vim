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

" Single mappings
let g:which_key_map['+'] = [ ':vertical resize +2'               , 'resize +2' ]
let g:which_key_map['-'] = [ ':vertical resize -2'               , 'resize -2' ]
let g:which_key_map['='] = [ '<C-W>='                            , 'balance windows' ]
let g:which_key_map['e'] = [ '<Plug>(easymotion-bd-w)'           , 'easymotion' ]
let g:which_key_map['S'] = [ 'Startify'                          , 'startify' ]
let g:which_key_map['u'] = [ ':UndotreeToggle'                   , 'undo tree']
let g:which_key_map['v'] = [ '<C-W>v'                            , 'split right']

" Group mappings

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'c' : [':ColorizerToggle'        , 'colorizer'],
      \ 'l' : [':Bracey'                 , 'start live server'],
      \ 'L' : [':BraceyStop'             , 'stop live server'],
      \ 'm' : [':MarkdownPreview'        , 'markdown preview'],
      \ 'M' : [':MarkdownPreviewStop'    , 'markdown preview stop'],
      \ 'n' : [':set nonumber!'          , 'line-numbers'],
      \ 'r' : [':set norelativenumber!'  , 'relative line nums'],
      \ 'p' : ['<Plug>Prettier'          , 'prettify file'],
      \ 's' : [':let @/ = ""'            , 'remove search highlight'],
      \ 't' : [':FloatermToggle'         , 'terminal'],
      \ 'w' : [':StripWhitespace'        , 'strip whitespace'],
      \ }

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1'],
      \ '2' : ['b2'        , 'buffer 2'],
      \ 'd' : [':Bdelete'  , 'delete-buffer'],
      \ 'f' : ['bfirst'    , 'first-buffer'],
      \ 'h' : ['Startify'  , 'home-buffer'],
      \ 'l' : ['blast'     , 'last-buffer'],
      \ 'n' : ['bnext'     , 'next-buffer'],
      \ 'p' : ['bprevious' , 'previous-buffer'],
      \ '?' : ['Buffers'   , 'fzf-buffer'],
      \ }

" c is for CoC
let g:which_key_map.c = {
      \ 'name' : '+coc' ,
      \ '.' : [':CocConfig'                                        , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                              , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'                            , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'                   , 'selected action'],
      \ 'c' : [':GCommit -m "'                                     , 'commit'],
      \ 'd' : [':CocFzfList diagnostics'                           , 'diagnostics'],
      \ 'e' : [':CocCommand explorer --sources=file+'              , 'explorer'],
      \ 'f' : ['<Plug>(coc-format-selected)'                       , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                                , 'format'],
      \ 'q' : ['<Plug>(coc-fix-current)'                           , 'quick fix'],
      \ 'r' : ['<Plug>(coc-rename)'                                , 'rename'],
      \ 'R' : ['<Plug>(coc-references)'                            , 'references'],
      \ 's' : [':CocList -I symbols'                               , 'symbols'],
      \ 'S' : [':CocFzfList snippets'                              , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'                       , 'type definition'],
      \ 'U' : [':CocUpdate'                                        , 'update CoC'],
      \ 'v' : [':Vista!!'                                          , 'tag viewer'],
      \ 'z' : [':CocDisable'                                       , 'disable CoC'],
      \ 'Z' : [':CocEnable'                                        , 'enable CoC'],
      \ }

" Hide git commit cc mapping
let g:which_key_map['c']['c'] = 'which_key_ignore'

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add %:p'                      , 'add current'],
      \ 'A' : [':Git add .'                        , 'add all'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':GBranches'                        , 'branches'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'f' : [':diffget //2'                      , 'get left'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'i' : [':Gist -b'                          , 'post gist'],
      \ 'j' : [':diffget //3'                      , 'get right'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
      \ 'P' : [':Git push'                         , 'push'],
      \ 'p' : [':Git pull'                         , 'pull'],
      \ 's' : [':Gstatus'                          , 'status'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }

let g:which_key_map.g.l = {
      \ 'name' : '+log' ,
      \ 'a' : [':Commits'              , 'log all'],
      \ 'c' : [':BCommits'             , 'log current file'],
      \ 'l' : [':Gclog -- %'           , 'classic log all'],
      \ }

" p is for project
let g:which_key_map.p = {
      \ 'name' : '+project' ,
      \ }
"
let g:which_key_map.p.r = {
      \ 'name' : '+refactor' ,
      \ }

let g:which_key_map['p']['w'] = 'find word'
let g:which_key_map['p']['r']['w'] = 'refactor word'

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'              , 'history'],
      \ ';' : [':Commands'              , 'commands'],
      \ 'a' : [':Ag'                    , 'text Ag'],
      \ 'b' : [':BLines'                , 'current buffer'],
      \ 'B' : [':Buffers'               , 'open buffers'],
      \ 'c' : [':Commits'               , 'commits'],
      \ 'C' : [':BCommits'              , 'buffer commits'],
      \ 'f' : [':Files'                 , 'files'],
      \ 'g' : [':GFiles'                , 'git files'],
      \ 'G' : [':GFiles?'               , 'modified git files'],
      \ 'h' : [':History'               , 'file history'],
      \ 'H' : [':History:'              , 'command history'],
      \ 'l' : [':Lines'                 , 'lines'] ,
      \ 'm' : [':Marks'                 , 'marks'] ,
      \ 'M' : [':Maps'                  , 'normal maps'] ,
      \ 'p' : [':Helptags'              , 'help tags'] ,
      \ 'P' : [':Tags'                  , 'project tags'],
      \ 's' : [':Colors'                , 'color schemes'],
      \ 't' : [':Rg'                    , 'text Rg'],
      \ 'T' : [':BTags'                 , 'buffer tags'],
      \ 'w' : [':Windows'               , 'search windows'],
      \ 'y' : [':Filetypes'             , 'file types'],
      \ 'z' : [':FZF'                   , 'FZF'],
      \ }

" t is for tablemode
let g:which_key_map.t = {
      \ 'name' : '+table_mode' ,
      \ }

let g:which_key_map['t']['m'] = 'toggle table mode'
let g:which_key_map['t']['t'] = 'tableize'


" Register which key map
call which_key#register('<Space>', "g:which_key_map")
